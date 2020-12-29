import Fluent
import FluentSQLiteDriver
import Leaf
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.sqlite(.file("Back40.sqlite")), as: .sqlite)

    app.migrations.add(CreateUsers())
    app.migrations.add(CreateCategories())
    app.migrations.add(CreateAmendments())
    app.migrations.add(CreateGrows())
    app.migrations.add(CreateWorks())
    app.migrations.add(CreatePractices())

//    let conn = try app.requestPooledConnection(to: .sqlite).wait()
//    
//    let practice = Practice(name: "Prepare and Till Beds", practice: "Till")
 //  practice.update(on:)

    //app.views.use(.leaf)

    
    
    
    // register routes
    try routes(app)
}
