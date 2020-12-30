import Fluent
import Vapor
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {

//    app.databases.use(.psql(.file("Back40.psql")), as: .psql)
//
//    let postgreSQLConfig = PostgreSQLDatabaseConfig(hostname: "localhost", username: "app_collection")
//    let postgreSQL = PostgreSQLDatabase(config: postgreSQLConfig)
    

   // try app.services.register(PostgreSQLProvider())
    
    let configuration = PostgresConfiguration(
        hostname: "localhost",
        username: "back40",
        password: "vapor_password",
        database: "back40"
    )
    

    
    try app.databases.use(.postgres(url: "postgres://sfmvmuuhosqowj:7a887858d12b7ceb6197db2fbde325bfdb0ed0a2cebfff724bc9e4af84e655b9@ec2-54-175-243-75.compute-1.amazonaws.com:5432/d42pnf4pp733t1"), as: .psql)
    
    
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
