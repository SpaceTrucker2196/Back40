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
    
    passwordProtected.post("login") { req -> User in
        try req.auth.require(User.self)
    }
    passwordProtected.post("users") { req -> User in
        try req.auth.require(User.self)
    }
    
    try app.register(collection: AmendmentsController())
    try app.register(collection: UsersController())
    try app.register(collection: CategoriesController())
    try app.register(collection: GrowsController())
    try app.register(collection: WorksController())
    try app.register(collection: PracticesController())
    try app.register(collection: MaterialsController())
}
