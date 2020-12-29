import Foundation
import Fluent

struct CreateMaterials: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Materials")
            .id()
            .field("name", .string)
            .field("notes", .string)
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Materials").delete()
    }
    
}
