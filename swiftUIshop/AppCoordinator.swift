//
//  AppCoordinator.swift
//  swiftUIshop
//
//  Created by Evgeny on 19.03.23.
//

import SwiftUI
import RealmSwift

enum Screen {
    case SignInPage
    case login
    case tabView
    case shoeView
}

class AppCoordinator: ObservableObject {
    @Published var currentScreen: Screen = .SignInPage {
        didSet {
            print(currentScreen)
        }
    }
    
    func showLoginScreen() {
        currentScreen = .login
    }
    
    func showSingInScreen() {
        currentScreen = .SignInPage
    }
    
    func showTabViewScreen() {
        currentScreen = .tabView
    }
    
    func showShoeView() {
        currentScreen = .shoeView
    }
}
