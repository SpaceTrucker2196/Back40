import Foundation
import FluentPostgresDriver
import Vapor

final class Work: Model, Content {

    static let schema = "Works"

    @ID(key: .id)
    var id: UUID?
  
    @Field(key: "name")
    var name: String
    
    @Field(key: "laborHours")
    var laborHours: Double
    
    @Field(key: "practice")
    var practice: String
    
    @Field(key: "practiceIndex")
    var practiceIndex: String
    
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
