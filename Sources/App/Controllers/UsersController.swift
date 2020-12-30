
import Vapor

struct UsersController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("users")
        users.get(use: index)
        users.post(use: create)
        users.group(":userID") { user in
            user.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[User]> {
        return User.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<User> {
        
        try User.Create.validate(content: req)
        
        let create = try req.content.decode(User.Create.self)
        
        guard create.password == create.confirmPassword else {
                throw Abort(.badRequest, reason: "Passwords did not match")
        }
        
        let user = try User(
            id:nil,
            name: create.name,
            username:create.username,
            passwordHash:Bcrypt.hash(create.password),
            email:create.email
        )
        
        return user.save(on: req.db).map { user }
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return User.find(req.parameters.get("userID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
    
}
