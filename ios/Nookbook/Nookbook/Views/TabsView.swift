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
    TabView(selection: $selectedTab) {
      UserView()
      .tag(0)
      .tabItem {
        Text("Home")
        Image(systemName: "leaf.circle.fill")
      }
      UserView()
      .tag(1)
      .tabItem {
        Text("Recipes")
        Image(systemName: "books.vertical.circle.fill")
      }
      UserView()
      .tag(2)
      .tabItem {
        Text("Villagers")
        Image(systemName: "person.2.crop.square.stack.fill")
      }
      UserView()
      .tag(3)
      .tabItem {
        Text("Settings")
        Image(systemName: "gear.circle.fill")
      }
    }
  }
}

struct TabsView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView().environmentObject(SessionStore(session: User.default))
  }
}
