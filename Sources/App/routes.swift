import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index", ["title": "Hello Deer!"])
    }

    app.get("version") { req -> String in
        return "Back40 v.03a"
    }

    try app.register(collection: UsersController())
    try app.register(collection: CategoriesController())
    try app.register(collection: GrowsController())
    try app.register(collection: WorksController())
}
