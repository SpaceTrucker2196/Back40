import Foundation
import FluentSQLiteDriver
import Vapor

final class Work: Model, Content {
    // Name of the table or collection.
    static let schema = "users"


    @ID(key: .id)
    var id: UUID?
  
    @Field(key: "name")
    var name: String
    
    @Field(key: "laborHours")
    var laborHours: Double
    
    @Field(key: "practice")
    var practice: String
    
    @Field(key: "practiceInde")
    var materialIndex: String
    
    @Field(key: "notes")
    var notes: String
    

    init() { }

    init(id: UUID? = nil, name: String, username: String) {
        self.id = id
        self.name = name
    }
    
    
}
