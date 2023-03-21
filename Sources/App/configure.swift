import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "postgres",
        password: Environment.get("DATABASE_PASSWORD") ?? "",
        database: Environment.get("DATABASE_NAME") ?? "muv1"
    ), as: .psql)
    
    // 1
    app.migrations.add(CreateTodo())
      
    // 2
    app.logger.logLevel = .debug

    // 3
    try app.autoMigrate().wait()
    
    app.migrations.add(Reviews())
      
    // 2
    app.logger.logLevel = .debug

    // 3
    try app.autoMigrate().wait()


   // app.migrations.add(CreateTodo())

    // register routes
    try routes(app)
}

