//
//  TabsView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/23/21.
//

import SwiftUI
import Firebase

struct TabsView: View {
  @EnvironmentObject var viewRouter: ViewRouter
  
  @State var signOutProcessing = false

  var body: some View {
    NavigationView {
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .navigationTitle("Nookbook")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            if signOutProcessing {
              ProgressView()
            } else {
              Button("Sign Out") { signOutUser() }
            }
          }
        }
    }
  }
  
  func signOutUser() {
    signOutProcessing = true
    let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
      signOutProcessing = false
    }
    withAnimation {
      viewRouter.currentRoute = .signInView
    }
  }
}

struct TabsView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView()
  }
}
