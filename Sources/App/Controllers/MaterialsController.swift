import Vapor


struct MaterialsController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let materials = routes.grouped("materials")
        materials.get(use: index)
        materials.post(use: create)
        materials.group(":materialID") { material in
                material.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Material]> {
        return Material.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Material> {
        let material = try req.content.decode(Material.self)
        return material.save(on: req.db).map { material }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Material.find(req.parameters.get("materialId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    
}

