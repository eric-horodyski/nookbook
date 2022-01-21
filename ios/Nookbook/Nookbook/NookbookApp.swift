//
//  NookbookApp.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/22/21.
//

import SwiftUI
import Firebase

@main
struct NookbookApp: App {
  @StateObject var session = SessionStore()
  @StateObject var tabRouter = TabsRouter()
  
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(session)
        .environmentObject(tabRouter)
    }
  }
}
