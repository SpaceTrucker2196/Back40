//
//  File.swift
//  
//
//  Created by Jeffrey Kunzelman on 12/16/20.
//

import Foundation

import Fluent

struct CreateWorks: Migration {
    // Prepares the database for storing Galaxy models.
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("works")
            .id()
            .field("id", .uuid)
            .field("timestamp", .date)
            .field("name", .string)
            .field("laborHours", .string)
            .field("practice", .string)
            .field("practiceIndex", .string)
            .field("notes", .string)
            .field("timestamp", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("works").delete()
    }
}
