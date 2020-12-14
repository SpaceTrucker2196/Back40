
import Foundation
import FluentSQLiteDriver
import Vapor

final class User: Model, Content {
    // Name of the table or collection.
    static let schema = "users"


    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String

    @Field(key: "username")
    var username: String

    init() { }

    init(id: UUID? = nil, name: String, username: String) {
        self.id = id
        self.name = name
        self.username = username
    }
    
    
}
