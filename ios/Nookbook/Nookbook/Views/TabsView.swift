//
//  TabsView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/23/21.
//

import SwiftUI

struct TabsView: View {  
  @EnvironmentObject var session: SessionStore
  @EnvironmentObject var router: TabsRouter
  
  init() {
    UITabBar.appearance().backgroundColor = UIColor(named: "BackgroundColor")
  }
  
  var body: some View {
    TabView(selection: $router.currentTab) {
      NavigationView {
        HomeView(apiKey: session.session!.apiKey)
          .navigationTitle("Dashboard")
      }
      .tag(Tab.dashboard)
      .tabItem { NBTabItem(label: "Dashboard", image: "IconHome") }
      .navigationViewStyle(StackNavigationViewStyle())
      NavigationView {
        RecipesView()
          .navigationTitle("Recipes")
      }
      .tag(Tab.recipes)
      .tabItem { NBTabItem(label: "Recipes", image: "IconRecipe") }
      .navigationViewStyle(StackNavigationViewStyle())
      NavigationView {
        VillagersView()
          .navigationTitle("Villagers")
      }
      .tag(Tab.villagers)
      .tabItem { NBTabItem(label: "Villagers", image: "IconVillagers") }
      .navigationViewStyle(StackNavigationViewStyle())
      NavigationView {
        SettingsView()
          .navigationTitle("Settings")
          .toolbar {
            Button(action: { session.signOut() }) {
              Text("Sign Out")
            }
          }
      }
      .tag(Tab.settings)
      .tabItem { NBTabItem(label: "More", image: "IconMore") }
      .navigationViewStyle(StackNavigationViewStyle())
    }
  }
}

struct TabsView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView()
      .environmentObject(SessionStore(session: User.default))
      .environmentObject(TabsRouter())
  }
}
