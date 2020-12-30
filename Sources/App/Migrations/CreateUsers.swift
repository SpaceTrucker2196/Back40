import Foundation
import Fluent

struct CreateUsers: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Users")
            .id()
            .field("name", .string, .required)
            .field("username", .string, .required)
            .field("email", .string, .required)
            .field("password_hash", .string, .required)
            
            .create()
    }

    // Optionally reverts the changes made in the prepare method.
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("Users").delete()
    }
}
