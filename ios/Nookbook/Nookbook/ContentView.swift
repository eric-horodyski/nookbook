//
//  ContentView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/22/21.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var session: SessionStore
  
  func getUser () {
    session.listen()
  }
  
  var body: some View {
    Group {
      if(session.session != nil) {
        TabsView()
      } else {
        LoginView()
      }
    }.onAppear { self.getUser() }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environmentObject(SessionStore(session: User.default))
  }
}
