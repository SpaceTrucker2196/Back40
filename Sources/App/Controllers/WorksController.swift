import Vapor

struct WorksController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let categories = routes.grouped("works")
        categories.get(use: index)
        categories.post(use: create)
        categories.group(":workId") { grow in
            grow.delete(use: delete)
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
        return Grow.find(req.parameters.get("growId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
