//
//  File.swift
//  
//
//  Created by ama alothman on 24/08/1444 AH.
//

import Fluent

struct Reviews: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("reviews")
            .id()
            .field("titlem", .string, .required)
            .field("movie_id", .uuid, .required)
            .field("contentreview", .string)
            .field("rate", .float)
            .create()

      
        
        
    }

    func revert(on database: Database) async throws {
        try await database.schema("reviews").delete()
    }
}
