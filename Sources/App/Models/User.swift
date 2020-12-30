
import Foundation
import FluentPostgresDriver
import Vapor
import Fluent

final class User: Model, Content {

    static let schema = "Users"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "username")
    var username: String
    
    @Field(key: "email")
    var email: String

    @Field(key: "password_hash")
    var passwordHash: String
    
    init() { }

    init(id: UUID? = nil, name: String, username: String, passwordHash:String, email:String) {
        self.id = id
        self.name = name
        self.username = username
        self.passwordHash = passwordHash
        self.email = email
    }
}

extension User {
    struct Create: Content {
        var name: String
        var email: String
        var username: String
        var password: String
        var confirmPassword: String
    }
}
extension User.Create: Validatable {
    static func validations(_ validations: inout Validations) {
        validations.add("name", as: String.self, is: !.empty)
        validations.add("username", as: String.self, is: !.empty)
        validations.add("email", as: String.self, is: !.empty)
        validations.add("password", as: String.self, is: .count(8...))
    }
}

extension User: ModelAuthenticatable {
    static let usernameKey = \User.$email
    static let passwordHashKey = \User.$passwordHash

    func verify(password: String) throws -> Bool {
        try Bcrypt.verify(password, created: self.passwordHash)
    }
}
