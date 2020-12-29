import Foundation
import FluentSQLiteDriver
import Vapor

final class Amendment: Model, Content {
    // Name of the table or collection.
    static let schema = "Amendments"

    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "applicationDate")
    var applicationDate: Date
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "laborHours")
    var laborHours: Double
    
    @Field(key: "material")
    var material: String
    
    @Field(key: "materialIndex")
    var materialIndex: String
    
    @Field(key: "notes")
    var notes: String
    
    @Field(key: "timestamp")
    var timestamp: Date

    init() { }

    init(id: UUID? = nil, name: String, username: String) {
        self.id = id
        self.name = name
        self.timestamp = Date()
    }
    
    
}
