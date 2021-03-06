import Foundation
import FluentPostgresDriver
import Vapor

final class Practice: Model, Content {
    // Name of the table or collection.
    static let schema = "Practices"


    @ID(key: .id)
    var id: UUID?
  
    @Field(key: "name")
    var name: String
    
    @Field(key: "laborEstimate")
    var laborEstimate: Double
    
    @Field(key: "notes")
    var notes: String
    
    @Field(key: "timestamp")
    var timestamp: Date

    init() { }

    init(id: UUID? = nil, name: String, practice: String) {
        self.id = id
        self.name = name
    }
    
    
}
