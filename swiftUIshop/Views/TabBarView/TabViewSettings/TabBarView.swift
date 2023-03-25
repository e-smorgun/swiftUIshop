import Combine
import SwiftUI

struct TabBarView: View {
    @State internal var selectedTab = 0
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case 0:
                HomeView(coordinator: AppCoordinator(), shoeAction: {
                    selectedTab = 5                }).environmentObject(HomeViewModel())
            case 1:
                LikedView()
            case 2:
                OrderView()
            case 3:
                ChatView()
            case 4:
                ProfileView(viewModel: ProfileViewModel(), coordinator: AppCoordinator(), logoutAction: {
                    coordinator.showSingInScreen()
                })
            case 5:
                ShoeView(coordinator: AppCoordinator())
                    .environmentObject(ShoeViewModel())
            default:
                EmptyView()
            }
            TabBottomView(tabBarImages: ["House", "Heart", "Order", "Chat", "Profile"], selectedIndex: $selectedTab)
        }
        .background(Color(red: 250/255, green: 251/255, blue: 255/255))
        .cornerRadius(20)
        .ignoresSafeArea(edges: .bottom)
    }
}

class TabBarCoordinator: NSObject, UITabBarControllerDelegate {
    
    var parent: TabBarView
    
    init(_ parent: TabBarView) {
        self.parent = parent
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        parent.selectedTab = tabBarController.selectedIndex
    }
}

extension TabBarView {
    func makeCoordinator() -> TabBarCoordinator {
        TabBarCoordinator(self)
    }
}

struct TabBarViewPreview: PreviewProvider {
    static var previews: some View {
        TabBarView(coordinator: AppCoordinator())
    }
}
