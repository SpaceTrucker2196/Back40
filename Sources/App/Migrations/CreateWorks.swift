import Foundation
import Fluent

struct CreateWorks: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Works")
            .id()
            .field("timestamp", .date)
            .field("name", .string)
            .field("laborHours", .double)
            .field("practice", .string)
            .field("practiceIndex", .string)
            .field("notes", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Works").delete()
    }
    
   
}
