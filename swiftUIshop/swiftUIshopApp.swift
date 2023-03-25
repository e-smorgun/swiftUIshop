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

@main
struct swiftUIshopApp: App {
    @ObservedObject var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            switch coordinator.currentScreen {
            case .SignInPage:
                SignInPageView(viewModel: SignInPageViewModel(), coordinator: coordinator)
            case .login:
                LoginView(viewModel: LoginViewModel(), coordinator: coordinator)
            case .tabView:
                TabBarView(coordinator: coordinator)
            case .shoeView:
                ShoeView(coordinator: AppCoordinator())
                    .environmentObject(ShoeViewModel())
            default:
                SignInPageView(viewModel: SignInPageViewModel(), coordinator: coordinator)
            }
        }
    }

}
