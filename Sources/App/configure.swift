import Fluent
import Vapor
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {

//    app.databases.use(.psql(.file("Back40.psql")), as: .psql)
//
//    let postgreSQLConfig = PostgreSQLDatabaseConfig(hostname: "localhost", username: "app_collection")
//    let postgreSQL = PostgreSQLDatabase(config: postgreSQLConfig)
    


    if let url = Environment.get("DATABASE_URL") {
      // configuring database
        try app.databases.use(.postgres(url:url), as: .psql)
    } else {
      // ...
    }
    
  
    
    
    app.migrations.add(CreateUsers())
    app.migrations.add(CreateCategories())
    app.migrations.add(CreateAmendments())
    app.migrations.add(CreateGrows())
    app.migrations.add(CreateWorks())
    app.migrations.add(CreatePractices())
    app.migrations.add(CreateMaterials())

    // register routes
    try routes(app)
}
