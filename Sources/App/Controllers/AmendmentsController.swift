//
//  File.swift
//  
//
//  Created by Jeffrey Kunzelman on 12/23/20.
//


import Vapor


struct AmendmentsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let amendments = routes.grouped("amendments")
            amendments.get(use: index)
            amendments.post(use: create)
            amendments.group(":amendmentID") { amendment in
                amendment.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Amendment]> {
        return Amendment.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Amendment> {
        let amendment = try req.content.decode(Amendment.self)
        return amendment.save(on: req.db).map { amendment }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Amendment.find(req.parameters.get("amendmentId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    
}
