//
//  RegistrationView.swift
//  swiftUIshop
//
//  Created by Evgeny on 19.03.23.
//

import SwiftUI

struct SignInPageView: View {
    
    @ObservedObject var viewModel: SignInPageViewModel
    @ObservedObject var coordinator: AppCoordinator
    @State private var isSecure: Bool = false
    
    var body: some View {
        
        Color(red: 250/255, green: 251/255, blue: 255/255)
            .ignoresSafeArea()
            .overlay(
                VStack(spacing: 78, content: {
                    Text("Sign in")
                        .font(.custom("Montserrat-SemiBold", size: 36))
                        .foregroundColor(.black)
                    VStack(spacing: 40) {
                        TextField("First name", text: $viewModel.firstName)
                            .font(.custom("Montserrat-Regular", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(100)
                        
                        TextField("Last name", text: $viewModel.lastName)
                            .font(.custom("Montserrat-Regular", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(100)
                        
                        TextField("Email", text: $viewModel.email)
                            .font(.custom("Montserrat-Regular", size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(100)
                        
                        HStack {
                            if isSecure {
                                TextField("Password", text: $viewModel.password)
                                    .font(.custom("Montserrat-Regular", size: 14))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
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
                                    .padding(.vertical, 8)
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
                        
                        VStack(alignment: .leading, spacing: 18) {
                            Button("Sign In", action: {
                                if viewModel.register() == false {
                                    let alert = UIAlertController(title: "Error", message: "The user with such mail already exists, or the data is not filled in correctly", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                                    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                                } else {
                                    let alert = UIAlertController(title: "Succesful!", message: "You have successfully registered", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                                    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                                }
                            }).font(.custom("Montserrat-Bold", size: 14))
                              .frame(maxWidth: .infinity, maxHeight: 45)
                              .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                              .cornerRadius(15)
                              .foregroundColor(.white)
                            
                            HStack(alignment: .center){
                                Text("Already have an account?")
                                    .font(.custom("Montserrat-Medium", size: 12))
                                    .foregroundColor(.gray)
                                
                                Button(action: {
                                    coordinator.showLoginScreen()
                                }) {
                                    Text("Log in")
                                        .font(.custom("Montserrat-Medium", size: 12))
                                }
                            }
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Button(action: {
                                // Sign in with Google`
                            }) {
                                HStack {
                                    Image("GoogleIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                    Text("Sign in with Google")
                                        .font(.custom("Montserrat-Medium", size: 14))
                                }.foregroundColor(.black)
                            }
                            
                            Button(action: {
                                // Sign in with Google`
                            }) {
                                HStack {
                                    Image("AppleIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                    Text("Sign in with Apple")
                                        .font(.custom("Montserrat-Medium", size: 14))
                                }.foregroundColor(.black)
                            }
                        }
                    }
                }).padding(.horizontal, 40))
    }
}

struct SignInPageViewPreview: PreviewProvider {
    static var previews: some View {
        SignInPageView(viewModel: SignInPageViewModel(), coordinator: AppCoordinator())
    }
}
