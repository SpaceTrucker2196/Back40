import Foundation
import FluentPostgresDriver
import Vapor

final class Material: Model, Content {
    // Name of the table or collection.
    static let schema = "Materials"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String
    
    @Field(key: "notes")
    var notes: String
    
    init() { }

    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
    
    
}
