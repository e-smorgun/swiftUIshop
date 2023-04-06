//
//  AppCoordinator.swift
//  swiftUIshop
//
//  Created by Evgeny on 19.03.23.
//

import SwiftUI
import RealmSwift

// MARK: - Screen enumeration
enum Screen {
    case SignInPage
    case login
    case tabView
    case shoeView
}

// MARK: - AppCoordinator class
class AppCoordinator: ObservableObject {
    // MARK: - Published property to track the current screen
    @Published var currentScreen: Screen = .SignInPage {
        didSet {
            print(currentScreen)
        }
    }
    // MARK: - Screen navigation methods
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
