import Vapor

struct WorksController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
            let works = routes.grouped("works")
            works.get(use: index)
            works.post(use: create)
            works.group(":workId") { grow in
            works.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Work]> {
        return Work.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Work> {
        let work = try req.content.decode(Work.self)
        return work.save(on: req.db).map { work }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Work.find(req.parameters.get("workId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
