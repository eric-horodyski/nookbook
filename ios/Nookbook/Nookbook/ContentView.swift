//
//  ContentView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/22/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var viewRouter: ViewRouter
  
  @State var username: String = ""
  @State var password: String = ""
  
  var body: some View {
    switch viewRouter.currentRoute {
    case .signUpView:
      SignUpView()
    case .signInView:
      SignInView()
    case .homeView:
      TabsView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(ViewRouter())
  }
}


