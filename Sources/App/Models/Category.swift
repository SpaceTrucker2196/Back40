
import Foundation
import FluentSQLiteDriver
import Vapor

final class Category: Model, Content {
    static let schema = "Categories"


    @ID(key: .id)
    var id: UUID?
    
//    @Children(key: "category_id")
//        var category: Category
//
    @Field(key: "name")
    var name: String
//
//    @Children(for: \.users)
//       var users: [User]
//    
    init() { }

    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
        
    }
    
    
}
