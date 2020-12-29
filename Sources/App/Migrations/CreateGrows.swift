import Foundation
import Fluent

struct CreateGrows: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Grows")
            .id()
            .field("name", .string)
            .field("address", .string)
            .field("city", .string)
            .field("county", .string)
            .field("cultivar", .string)
            .field("drivingDirections", .string)
            .field("expectedHarvestDate", .date)
            .field("growType", .string)
            .field("harvestDate", .date)
            .field("locationName", .string)
            .field("manager", .string)
            .field("managerPhone", .string)
            .field("notes", .string)
            .field("plantedDate", .date)
            .field("propertyOwner", .string)
            .field("propertyOwnerPhone", .string)
            .field("propertyType", .string)
            .field("size", .double)
            .field("title", .string)
            .field("zip", .string)
            .field("timestamp", .date)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Grows").delete()
    }
}
