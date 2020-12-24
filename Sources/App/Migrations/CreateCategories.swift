//
//  File.swift
//  
//
//  Created by Jeffrey Kunzelman on 12/14/20.
//

import Foundation

import Fluent

struct CreateCategories: Migration {
 
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Categories")
            .id()
            .field("name", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Categories").delete()
    }
}
