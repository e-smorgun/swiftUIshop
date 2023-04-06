//
//  TabBottomView.swift
//  swiftUIshop
//
//  Created by Evgeny on 20.03.23.
//

import SwiftUI

// MARK: - TabBottomView
struct TabBottomView: View {
    
    // MARK: Properties
    let tabBarImages: [String]
    var height: CGFloat = 90
    @Binding var selectedIndex: Int
    
    // MARK: Body
    var body: some View {
        HStack {
            Spacer()
            
            ForEach(tabBarImages.indices) { index in
                let item = tabBarImages[index]
                Button {
                    self.selectedIndex = index
                } label: {
                    let isSelected = selectedIndex == index
                    TabItemView(image: item, isSelected: isSelected)
                }
                Spacer()
            }
        }.frame(height: height)
        .background(Color.white)
        .cornerRadius(30)
        .ignoresSafeArea()
    }
}

// MARK: - Prewiew
struct TabBarViewPreview2: PreviewProvider {
    static var previews: some View {
        TabBarView(coordinator: AppCoordinator())
    }
}
