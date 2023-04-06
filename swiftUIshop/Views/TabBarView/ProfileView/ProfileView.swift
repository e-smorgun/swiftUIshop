//
//  AccountView.swift
//  swiftUIshop
//
//  Created by Evgeny on 20.03.23.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    @StateObject var viewModel = ProfileViewModel()
    var coordinator: AppCoordinator
    var logoutAction: (() -> Void)?
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color(red: 250/255, green: 251/255, blue: 255/255)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    profileView
                    changePhotoButton
                    Text("Satria Adhi Pradana") //Можно поставить имя, указанное при регистрации. Не сделал, потому что в задании было указано сделать это имя
                        .font(.custom("Montserrat-Bold", size: 16))
                        .padding()
                    uploadItemButton
                    list
                }
            }
        }
    }

    // MARK: - Subviews
    private var profileView: some View {
        if let image = viewModel.profileImage {
            return Image(uiImage: image)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
        } else {
            return Image("ProfileImage")
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
        }
    }

    private var changePhotoButton: some View {
        // Change photo button
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
    }

    private var uploadItemButton: some View {
        // Upload item button
        // Сделал то, что и на change photo
        Button {
            viewModel.selectPhoto()
        } label: {
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
    }

    private var list: some View {
        // List of options
        List {
            listRow(view: EmptyView(), imageName: "Balance", text: "Trade store")
            listRow(view: EmptyView(), imageName: "Balance", text: "Payment Method")
            listRowWithBalance
            listRow(view: EmptyView(), imageName: "Balance", text: "Trade History")
            listRow(view: EmptyView(), imageName: "Balance", text: "Restore Purchase")
            lostRowLogOut
        }
        .scrollDisabled(true)
        .background(Color(red: 250/255, green: 251/255, blue: 255/255))
        .listStyle(PlainListStyle())
    }

    private func listRow<Content: View>(view: Content, imageName: String, text: String) -> some View {
        NavigationLink(destination: view) {
            HStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .padding(10)
                    .background(Color(red: 238/255, green: 239/255, blue: 244/255))
                    .foregroundColor(Color(red: 112/255, green: 113/255, blue: 143/255))
                    .clipShape(Circle())
                Text(text)
                    .font(.custom("Montserrat-Medium", size: 16))
            }
        }.listRowBackground(Color(red: 250/255, green: 251/255, blue: 255/255))
         .listRowSeparator(.hidden)
    }
    
    private var listRowWithBalance: some View {
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
    }
    
    private var lostRowLogOut: some View {
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
                    .foregroundColor(.black)
            }
        }.listRowBackground(Color(red: 250/255, green: 251/255, blue: 255/255))
            .listRowSeparator(.hidden)
    }
}

// MARK: - Prewiew
struct ProfileViewPreview: PreviewProvider {
    static var previews: some View {
        ProfileView(coordinator: AppCoordinator())
    }
}
