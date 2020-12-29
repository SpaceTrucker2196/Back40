import Foundation
import Fluent

struct CreatePractices: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Practices")
            .id()
            .field("timestamp", .date)
            .field("name", .string)
            .field("laborEstimate", .string)
            .field("notes", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Practices").delete()
    }
    
    
}
