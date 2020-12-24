//
//  File.swift
//  
//
//  Created by Jeffrey Kunzelman on 12/14/20.
//

import Foundation

import Fluent

struct CreateUsers: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Users")
            .id()
            .field("name", .string)
            .field("username", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Users").delete()
    }
}
