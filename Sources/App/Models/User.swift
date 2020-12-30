
import Foundation
import FluentPostgresDriver
import Vapor

final class User: Model, Content {
    // Name of the table or collection.
    static let schema = "Users"


    @ID(key: .id)
    var id: UUID?
    
//    @Parent(key: "category_id")
//    var category: Category
    
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
