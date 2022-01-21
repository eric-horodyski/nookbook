import Foundation

enum Tab: Hashable {
  case dashboard
  case recipes
  case villagers
  case settings
}

class TabsRouter: ObservableObject {
  @Published var currentTab: Tab = .dashboard
}
