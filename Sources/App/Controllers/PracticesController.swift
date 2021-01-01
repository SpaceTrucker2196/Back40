import Vapor

struct PracticesController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
            let practices = routes.grouped("practices")
            practices.get(use: index)
            practices.post(use: create)
            practices.group(":practiceId") { practice in
                practice.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Practice]> {
        return Practice.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Practice> {
        let practice = try req.content.decode(Practice.self)
        return practice.save(on: req.db).map { practice }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Practice.find(req.parameters.get("practiceId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
