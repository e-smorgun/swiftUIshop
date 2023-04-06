//
//  TabBarItemView.swift
//  swiftUIshop
//
//  Created by Evgeny on 20.03.23.
//

import SwiftUI

// MARK: - TabItemView
struct TabItemView: View {
    
    // MARK: Properties
    let image: String
    let isSelected: Bool
    
    // MARK: Body
    var body: some View {
        VStack {
            if isSelected == true {
                Image(String(image + "Active"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(10)
                    .background(Color(red: 238/255, green: 239/255, blue: 244/255))
                    .foregroundColor(Color(red: 112/255, green: 113/255, blue: 143/255))
                    .clipShape(Circle())
            } else {
                Image(String(image + "Icon"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding(10)
                    .background(Color.white)
                    .foregroundColor(Color(red: 145/255, green: 145/255, blue: 145/255))
            }
        }
    }
}

// MARK: - Prewiew
struct TabBarViewPreview3: PreviewProvider {
    static var previews: some View {
        TabBarView(coordinator: AppCoordinator())
    }
}
