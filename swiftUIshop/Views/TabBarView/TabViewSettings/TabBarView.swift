import Combine
import SwiftUI

// MARK: - TabBarView
struct TabBarView: View {
    // MARK: Properties
    @State internal var selectedTab = 0
    @ObservedObject var coordinator: AppCoordinator
    
    // MARK: Body
    var body: some View {
        VStack(spacing: 0) {
            // MARK: Switch selectedTab
            switch selectedTab {
            case 0:
                HomeView(coordinator: AppCoordinator(), shoeAction: {
                    selectedTab = 5
                }).environmentObject(HomeViewModel())
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
            // MARK: TabBottomView
            TabBottomView(tabBarImages: ["House", "Heart", "Order", "Chat", "Profile"], selectedIndex: $selectedTab)
        }
        .background(Color(red: 250/255, green: 251/255, blue: 255/255))
        .cornerRadius(20)
        .ignoresSafeArea(edges: .bottom)
    }
}

// MARK: - TabBarCoordinator
class TabBarCoordinator: NSObject, UITabBarControllerDelegate {
    // MARK: Properties
    var parent: TabBarView
    
    // MARK: Initializer
    init(_ parent: TabBarView) {
        self.parent = parent
    }
    
    // MARK: UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        parent.selectedTab = tabBarController.selectedIndex
    }
}

// MARK: - Extension TabBarView
extension TabBarView {
    // MARK: Coordinator
    func makeCoordinator() -> TabBarCoordinator {
        TabBarCoordinator(self)
    }
}

// MARK: - Prewiew
struct TabBarViewPreview: PreviewProvider {
    static var previews: some View {
        TabBarView(coordinator: AppCoordinator())
    }
}
