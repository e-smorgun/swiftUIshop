//
//  LogInViewModel.swift
//  swiftUIshop
//
//  Created by Evgeny on 19.03.23.
//

import Combine
import RealmSwift

class LoginViewModel: ObservableObject {
    // MARK: Published Properties
    @Published var email: String = ""
    @Published var password: String = ""
    
    // MARK: Private Properties
    private let userRepository = RealmUserRepository()
    private var cancellable: AnyCancellable?
    
    // MARK: Methods
    func login() -> String {
        return userRepository.login(email: email, password: password)
    }
    
}
