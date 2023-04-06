//
//  User.swift
//  swiftUIshop
//
//  Created by Evgeny on 19.03.23.
//

import RealmSwift

// MARK: - Users
class Users: Object {
    // MARK: Properties
    @objc dynamic var id: UUID
    @objc dynamic var firstName: String
    @objc dynamic var lastName: String
    @objc dynamic var email: String
    @objc dynamic var password: String
    
    // MARK: Initialization
    override init() {
        self.id = UUID()
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.password = ""
    }
    
    init(id: UUID, firstName: String, lastName: String, email: String, password: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
    
    // MARK: Primary Key
    override static func primaryKey() -> String? {
        return "id"
    }
}
