import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index", ["title": "Hello Der!"])
    }

    app.get("version") { req -> String in
        return "Back40 v.03a"
    }


    let passwordProtected = app.grouped(User.authenticator())
    passwordProtected.post("login") { req -> EventLoopFuture<UserToken> in
        let user = try req.auth.require(User.self)
        let token = try user.generateToken()
        return token.save(on: req.db)
            .map { token }
    }

    let tokenProtected = app.grouped(UserToken.authenticator())
    tokenProtected.get("me") { req -> User in
        try req.auth.require(User.self)
    }

    
    try tokenProtected.register(collection: AmendmentsController())
    try passwordProtected.register(collection: UsersController())
    try tokenProtected.register(collection: CategoriesController())
    try tokenProtected.register(collection: GrowsController())
    try tokenProtected.register(collection: WorksController())
    try tokenProtected.register(collection: PracticesController())
    try tokenProtected.register(collection: MaterialsController())
}
