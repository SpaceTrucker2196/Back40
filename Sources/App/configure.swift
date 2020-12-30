import Fluent
import Vapor
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {

    if let databaseURL = Environment.get("DATABASE_URL"), var postgresConfig = PostgresConfiguration(url: databaseURL) {
        postgresConfig.tlsConfiguration = .forClient(certificateVerification: .none)
        app.databases.use(.postgres(
            configuration: postgresConfig
        ), as: .psql)
        
        app.migrations.add(CreateUsers())
        app.migrations.add(CreateCategories())
        app.migrations.add(CreateAmendments())
        app.migrations.add(CreateGrows())
        app.migrations.add(CreateWorks())
        app.migrations.add(CreatePractices())
        app.migrations.add(CreateMaterials())
    } 

    // register routes
    try routes(app)
}
