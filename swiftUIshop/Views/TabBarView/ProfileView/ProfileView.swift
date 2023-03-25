//
//  AccountView.swift
//  swiftUIshop
//
//  Created by Evgeny on 20.03.23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var coordinator: AppCoordinator
    var logoutAction: (() -> Void)?
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .top) {
                
                Color(red: 250/255, green: 251/255, blue: 255/255)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    if let image = viewModel.profileImage {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                    } else {
                        Image("ProfileImage")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                    }
                    
                    
                    Button(action: {
                        viewModel.selectPhoto()
                    }) {
                            Text("Change photo")
                                .font(.custom("Montserrat-Regular", size: 8))
                                .foregroundColor(.gray)
                        }
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .padding(5)
                    
                    Text("Satria Adhi Pradana")
                        .font(.custom("Montserrat-Bold", size: 16))
                        .padding()
                    
                    Button {
                        viewModel.selectPhoto()                    } label: {
                            HStack(spacing: 10) {
                                Image(systemName: "square.and.arrow.up")
                                Text("Upload Item")
                                    .font(.custom("Montserrat-Bold", size: 14))
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        .padding(.horizontal, 43)
                        .padding(.vertical, 10)
                    
                    List {
                        NavigationLink(destination: EmptyView()) {
                            HStack {
                                Image("Balance")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(Color(red: 238/255, green: 239/255, blue: 244/255))
                                    .foregroundColor(Color(red: 112/255, green: 113/255, blue: 143/255))
                                    .clipShape(Circle())
                                Text("Trade store")
                                    .font(.custom("Montserrat-Medium", size: 16))
                            }
                        }.listRowBackground(Color(red: 250/255, green: 251/255, blue: 255/255))
                            .listRowSeparator(.hidden)
                        
                        NavigationLink(destination: EmptyView()) {
                            HStack {
                                Image("Balance")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(Color(red: 238/255, green: 239/255, blue: 244/255))
                                    .foregroundColor(Color(red: 112/255, green: 113/255, blue: 143/255))
                                    .clipShape(Circle())
                                Text("Payment Method")
                                    .font(.custom("Montserrat-Medium", size: 16))
                            }
                        }.listRowBackground(Color(red: 250/255, green: 251/255, blue: 255/255))
                            .listRowSeparator(.hidden)
                        
                        HStack {
                            Image("Balance")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(10)
                                .background(Color(red: 238/255, green: 239/255, blue: 244/255))
                                .foregroundColor(Color(red: 112/255, green: 113/255, blue: 143/255))
                                .clipShape(Circle())
                            Text("Balance")
                                .font(.custom("Montserrat-Medium", size: 16))
                            
                            Text("$ 1593")
                                .font(.custom("Montserrat-Medium", size: 16))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }.listRowBackground(Color(red: 250/255, green: 251/255, blue: 255/255))
                            .listRowSeparator(.hidden)
                        
                        NavigationLink(destination: EmptyView()) {
                            HStack {
                                Image("Balance")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(Color(red: 238/255, green: 239/255, blue: 244/255))
                                    .foregroundColor(Color(red: 112/255, green: 113/255, blue: 143/255))
                                    .clipShape(Circle())
                                Text("Trade History")
                                    .font(.custom("Montserrat-Medium", size: 16))
                            }
                        }.listRowBackground(Color(red: 250/255, green: 251/255, blue: 255/255))
                            .listRowSeparator(.hidden)
                        
                        NavigationLink(destination: EmptyView()) {
                            HStack {
                                Image("Restore")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(Color(red: 238/255, green: 239/255, blue: 244/255))
                                    .foregroundColor(Color(red: 112/255, green: 113/255, blue: 143/255))
                                    .clipShape(Circle())
                                Text("Restore Purchase")
                                    .font(.custom("Montserrat-Medium", size: 16))
                            }
                        }.listRowBackground(Color(red: 250/255, green: 251/255, blue: 255/255))
                            .listRowSeparator(.hidden)
                        
                        Button(action: {
                            //help view
                        }) {
                            HStack {
                                Image("Help")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(Color(red: 238/255, green: 239/255, blue: 244/255))
                                    .foregroundColor(Color(red: 112/255, green: 113/255, blue: 143/255))
                                    .clipShape(Circle())
                                Text("Help")
                                    .font(.custom("Montserrat-Medium", size: 16))
                            }
                        }.listRowBackground(Color(red: 250/255, green: 251/255, blue: 255/255))
                            .listRowSeparator(.hidden)
                        
                        Button(action: {
                            logoutAction?()
                        }) {
                            HStack {
                                Image("LogOut")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(Color(red: 238/255, green: 239/255, blue: 244/255))
                                    .foregroundColor(Color(red: 112/255, green: 113/255, blue: 143/255))
                                    .clipShape(Circle())
                                Text("Log out")
                                    .font(.custom("Montserrat-Medium", size: 16))
                            }
                        }.listRowBackground(Color(red: 250/255, green: 251/255, blue: 255/255))
                            .listRowSeparator(.hidden)
                        
                    }
                    .scrollDisabled(true)
                    .background(Color(red: 250/255, green: 251/255, blue: 255/255))
                    .listStyle(PlainListStyle())
                }
            }
            .navigationBarTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileViewPreview: PreviewProvider {
    static var previews: some View {
        ProfileView(coordinator: AppCoordinator())
    }
}
