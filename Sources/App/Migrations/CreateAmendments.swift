//
//  File.swift
//  
//
//  Created by Jeffrey Kunzelman on 12/16/20.
//

import Foundation

import Fluent

struct CreateAmendments: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Amendments")
            .id()
            .field("applicationDate", .date)
            .field("name", .string)
            .field("laborHours", .double)
            .field("material", .string)
            .field("materialIndex", .string)
            .field("notes", .string)
            .field("timestamp", .date)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Amendments").delete()
    }
}
