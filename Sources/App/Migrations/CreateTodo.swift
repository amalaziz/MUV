import Fluent

struct CreateTodo: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("movies")
            .id()
            .field("title", .string, .required)
            .field("yearm", .int, .required)
            .field("description", .string, .required)
            .field("castname", .string)
            .field("avg_rate", .float)
            .create()
        
    }

    func revert(on database: Database) async throws {
        try await database.schema("movies").delete()
    }
}
