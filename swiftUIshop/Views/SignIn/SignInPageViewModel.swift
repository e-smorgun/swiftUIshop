//
//  RegistrationViewModel.swift
//  swiftUIshop
//
//  Created by Evgeny on 19.03.23.
//

import Combine
import RealmSwift

class SignInPageViewModel: ObservableObject {
    
    // MARK: Published Properties
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    // MARK: Private Properties
    private var cancellable: AnyCancellable?
    private let userRepository = RealmUserRepository()
    private let emailValidator = EmailValidator()
    
    // MARK: Methods
    func register() -> Bool {
        print(firstName, lastName, email, password)
        if firstName == "" || lastName == "" || email == "" || password == "" {
            print(1)
            return false
        } else if  !emailValidator.validate(email) {
            print(2)
            return false
        }
        
        if userRepository.getUser(withEmail: email) != nil {
            print(3)
            return false
        } else {
            let user = Users(id: UUID(), firstName: firstName, lastName: lastName, email: email, password: password)
            
            userRepository.addUser(user)
            return true
        }
    }
}

