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
            .field("laborHours", .string)
            .field("material", .string)
            .field("materialIndex", .string)
            .field("notes", .string)
            .field("timestamp", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("amendments").delete()
    }
}
