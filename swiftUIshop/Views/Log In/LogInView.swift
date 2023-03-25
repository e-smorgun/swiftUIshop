//
//  LogInView.swift
//  swiftUIshop
//
//  Created by Evgeny on 19.03.23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    @ObservedObject var coordinator: AppCoordinator
    @State private var isSecure: Bool = false
    
    var body: some View {
        
        Color(red: 250/255, green: 251/255, blue: 255/255)
            .ignoresSafeArea()
            .overlay(VStack(spacing: 100, content: {
                Text("Welcome Back")
                    .font(.custom("Montserrat-SemiBold", size: 36))
                    .foregroundColor(.black)
                VStack(spacing: 35) {
                    TextField("Email", text: $viewModel.email)
                        .font(.custom("Montserrat-Regular", size: 14))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.vertical, 7.5)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(100)
                    
                    HStack {
                        if isSecure {
                            TextField("Password", text: $viewModel.password)
                                .font(.custom("Montserrat-Regular", size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                                .padding(.vertical, 7.5)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(100)
                                .overlay(alignment: .trailing) {
                                    Button(action: {
                                        isSecure.toggle()
                                    }) {
                                        Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill")
                                            .foregroundColor(.gray)
                                            .padding(.horizontal, 10)
                                    }
                                }
                        } else {
                            SecureField("Password", text: $viewModel.password)
                                .font(.custom("Montserrat-Regular", size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                                .padding(.vertical, 7.5)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(100)
                                .overlay(alignment: .trailing) {                          Button(action: {
                                    isSecure.toggle()
                                }) {
                                    Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill")
                                        .foregroundColor(.gray)
                                        .padding(.horizontal, 10)
                                }
                                }
                        }
                    }
                    
                    Button("Login", action: {
                        let buffer = viewModel.login()
                        if buffer == "Succesful" {
                            coordinator.showTabViewScreen()
                        } else {
                            let alert = UIAlertController(title: "Error", message: buffer, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                        }
                    })
                    .font(.custom("Montserrat-Bold", size: 14))
                    .frame(maxWidth: .infinity, maxHeight: 45)
                    .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .offset(y: 64)
                }
            }).padding(.horizontal, 43))
    }
}


struct LoginViewPreview: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(), coordinator: AppCoordinator())
    }
}

