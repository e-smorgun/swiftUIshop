//
//  RegistrationView.swift
//  swiftUIshop
//
//  Created by Evgeny on 19.03.23.
//

import SwiftUI

// MARK: - SignInPageView
struct SignInPageView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: SignInPageViewModel
    @ObservedObject var coordinator: AppCoordinator
    @State private var isSecure: Bool = false
    
    // MARK: - Body
    var body: some View {
        Color(red: 250/255, green: 251/255, blue: 255/255)
            .ignoresSafeArea()
            .overlay(
                VStack(spacing: 100, content: {
                    signInView
                    VStack(spacing: 20, content: {
                        firstNameTextField
                        lastNameTextField
                        emailNameTextField
                        passwordTextField
                    }).padding(.horizontal, 43)
                    
                    VStack(alignment: .leading) {
                        loginButton
                        goToLogin
                    }.padding(.horizontal, 43)
                    
                    signWithSocialNetwork
                })
            )
    }
    
    // MARK: - Subviews
    // Welcome View
    private var signInView: some View {
        Text("Sign In")
            .font(.custom("Montserrat-SemiBold", size: 36))
            .foregroundColor(.black)
    }
    
    // First Name Text Field
    private var firstNameTextField: some View {
        TextField("First name", text: $viewModel.email)
            .font(.custom("Montserrat-Regular", size: 14))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.horizontal)
            .padding(.vertical, 7.5)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(100)
    }
    
    // Last Name Text Field
    private var lastNameTextField: some View {
        TextField("Last Name", text: $viewModel.email)
            .font(.custom("Montserrat-Regular", size: 14))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.horizontal)
            .padding(.vertical, 7.5)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(100)
    }
    
    // Email Text Field
    private var emailNameTextField: some View {
        TextField("Email", text: $viewModel.email)
            .font(.custom("Montserrat-Regular", size: 14))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.horizontal)
            .padding(.vertical, 7.5)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(100)
    }
    
    // Password Text Field
    private var passwordTextField: some View {
        if isSecure {
            return AnyView(
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
            )
        } else {
            return AnyView(
                SecureField("Password", text: $viewModel.password)
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
            )
        }
    }
    
    // Sign In Button
    private var loginButton: some View {
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
        }
    }
    
    // Go to login lavel
    private var goToLogin: some View {
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
    
    // Sign with social network
    private var signWithSocialNetwork: some View {
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
}

// MARK: - Preview
struct SignInPageViewPreview: PreviewProvider {
    static var previews: some View {
        SignInPageView(viewModel: SignInPageViewModel(), coordinator: AppCoordinator())
    }
}
