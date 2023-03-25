//
//  UserRepository.swift
//  swiftUIshop
//
//  Created by Evgeny on 21.03.23.
//

import RealmSwift

protocol UserRepository {
    func getUser(withEmail email: String) -> Users?
    func addUser(_ user: Users)
    func login(email: String, password: String) -> String
}

class RealmUserRepository: UserRepository {
    private let realm = try! Realm()
    
    func getUser(withEmail email: String) -> Users? {
        return realm.objects(Users.self).filter("email == %@", email).first
    }
    
    func addUser(_ user: Users) {
        let newUser = Users(id: UUID(), firstName: user.firstName, lastName: user.lastName, email: user.email, password: user.password)
        
        try! realm.write {
            realm.add(newUser)
        }
    }
    
    func login(email: String, password: String) -> String {
        guard !email.isEmpty && !password.isEmpty else {
            return "First name and password cannot be empty."
        }
        guard let user = realm.objects(Users.self).filter("email == %@", email).first else {
            return "User not found."
        }
        guard user.password == password else {
            return "Incorrect password."
        }
        
        let newUser = Users()
        newUser.email = email
        newUser.password = password
        
        try! realm.write {
            realm.add(newUser)
        }
        
        return "Succesful"
    }
}


