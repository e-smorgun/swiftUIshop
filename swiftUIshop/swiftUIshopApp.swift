//
//  swiftUIshopApp.swift
//  swiftUIshop
//
//  Created by Evgeny on 17.03.23.
//

import SwiftUI

//@main
//struct swiftUIshopApp: App {
//    let appCoordinator = AppCoordinator()
//    
//    var body: some Scene {
//        WindowGroup {
//            RegistrationView(viewModel: RegistrationViewModel())
//                .environmentObject(appCoordinator)
//        }
//    }
//}

// MARK: - App Entry Point
@main
struct swiftUIshopApp: App {
    // MARK: - Properties
    @ObservedObject var coordinator = AppCoordinator()

    // MARK: - App Scene
    var body: some Scene {
        WindowGroup {
            switch coordinator.currentScreen {
                // MARK: - Sign In Page
            case .SignInPage:
                SignInPageView(viewModel: SignInPageViewModel(), coordinator: coordinator)
                // MARK: - Login View
            case .login:
                LoginView(viewModel: LoginViewModel(), coordinator: coordinator)
                // MARK: - Tab Bar View
            case .tabView:
                TabBarView(coordinator: coordinator)
                // MARK: - Shoe View
            case .shoeView:
                ShoeView(coordinator: AppCoordinator())
                    .environmentObject(ShoeViewModel())
                // MARK: - Default to Sign In Page
            default:
                SignInPageView(viewModel: SignInPageViewModel(), coordinator: coordinator)
            }
        }
    }

}
