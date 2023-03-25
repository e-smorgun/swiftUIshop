//
//  LogInViewModel.swift
//  swiftUIshop
//
//  Created by Evgeny on 19.03.23.
//

import Combine
import RealmSwift

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    private let userRepository = RealmUserRepository()
    private var cancellable: AnyCancellable?
    
    func login() -> String {
        return userRepository.login(email: email, password: password)
    }
    
}
