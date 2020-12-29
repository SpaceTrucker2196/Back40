import Foundation
import FluentSQLiteDriver
import Vapor

final class Grow: Model, Content {
    static let schema = "Grows"


    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "address")
    var address: String
    
    @Field(key: "city")
    var city: String
    
    @Field(key: "county")
    var county: String
    
    @Field(key: "cultivar")
    var cultivar: String
    
    @Field(key: "drivingDirections")
    var drivingDirections: String
    
    @Field(key: "expectedHarvestDate")
    var expectedHarvestDate: Date
    
    @Field(key: "growType")
    var growType: String
    
    @Field(key: "harvestDate")
    var harvestDate: Date
    
    @Field(key: "locationName")
    var locationName: String
    
    @Field(key: "manager")
    var manager: String
    
    @Field(key: "managerPhone")
    var managerPhone: String
    
    @Field(key: "notes")
    var notes: String
    
    @Field(key: "plantedDate")
    var plantedDate: Date
    
    @Field(key: "propertyOwner")
    var propertyOwner: String

    @Field(key: "propertyOwnerPhone")
    var propertyOwnerPhone: String
    
    @Field(key: "propertyType")
    var propertyType : String
    
    @Field(key: "size")
    var size: Double
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "zip")
    var zip: String
    
    @Field(key: "timestamp")
    var timestamp: Date
    
//
    
    init() { }

    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
    
    
}
