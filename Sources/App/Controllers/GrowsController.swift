import Vapor

struct GrowsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let grows = routes.grouped("grows")
        grows.get(use: index)
        grows.post(use: create)
        grows.group(":growId") { grow in
            grow.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Grow]> {
        return Grow.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Grow> {
        let grow = try req.content.decode(Grow.self)
        return grow.save(on: req.db).map { grow }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Grow.find(req.parameters.get("growId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
