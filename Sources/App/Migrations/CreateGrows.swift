//
//  File.swift
//  
//
//  Created by Jeffrey Kunzelman on 12/16/20.
//

import Foundation
struct CreateGrows: Migration {
    // Prepares the database for storing Galaxy models.
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("grows")
            .id()
            .field("id", .uuid)
            .field("name", .string)
            .field("address", .string)
            .field("city", .string)
            .field("county", .string)
            .field("cultivar", .string)
            .field("drivingDirections", .string)
            .field("expectedHarvestDate", .date)
            .field("growType", .string)
            .field("harvestDate", .string)
            .field("locationName", .string)
            .field("manager", .string)
            .field("managerPhone", .string)
            .field("notes", .string)
            .field("plantedDate", .string)
            .field("propertyOwner", .string)
            .field("propertyOwnerPhone", .string)
            .field("propertyType", .string)
            .field("size", .string)
            .field("title", .string)
            .field("zip", .string)
            .field("timestamp", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("grows").delete()
    }
}
