//
//  TabsView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/23/21.
//

import SwiftUI

struct TabsView: View {  
  @EnvironmentObject var session: SessionStore
  
  private enum Tab: Hashable {
    case home
    case recipes
    case villagers
    case user
    // home (misc items for sale), recipes, villagers, items, user
  }
  
  @State private var selectedTab: Tab = .home
  
  var body: some View {
    ZStack {
      TabView(selection: $selectedTab) {
        HomeView()
        .tag(0)
        .tabItem {
          Text("Home")
          Image("IconHome").renderingMode(.template)
        }
        SettingsView()
        .tag(1)
        .tabItem {
          Text("Recipes")
          Image("IconRecipe").renderingMode(.template)
        }
        SettingsView()
        .tag(2)
        .tabItem {
          Text("Villagers")
          Image("IconVillagers").renderingMode(.template)
        }
        SettingsView()
        .tag(3)
        .tabItem {
          Text("More")
          Image("IconMore").renderingMode(.template)
        }
      }.onAppear {
        UITabBar.appearance().backgroundColor = UIColor(named: "BackgroundColor")
      }
    }
  }
}

struct TabsView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView().environmentObject(SessionStore(session: User.default))
  }
}
