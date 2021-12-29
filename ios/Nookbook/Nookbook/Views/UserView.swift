//
//  UserView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/29/21.
//

import SwiftUI

struct UserView: View {
  @EnvironmentObject var session: SessionStore
  
  @State var processing: Bool = false
  @State var name: String = Island.default.name
  
  var body: some View {
    NavigationView {
      ZStack {
        Color("BackgroundColor").edgesIgnoringSafeArea(.all).ignoresSafeArea()
        VStack{
          List {
            if let user = session.session {
              Section(header: Text("User Details")) {
                HStack {
                  Text("Email:").fontWeight(.semibold)
                  Spacer()
                  Text(user.email ?? "")
                }
                HStack {
                  Text("ID:").fontWeight(.semibold)
                  Spacer()
                  Text(user.uid)
                }
              }
            }
            if Island.default != nil {
              Section(header: Text("Island Information")) {
                HStack {
                  Text("Island Name:").fontWeight(.semibold)
                  TextField("Island Name", text: $name)
   
                  
                }
                HStack() {
                  Text("Native Fruit:").fontWeight(.semibold)
                  Spacer()
                  Text(Island.default.fruit.description)
                }
              }
            }
          }.onAppear {
            UITableView.appearance().backgroundColor = .clear
          }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Settings")
        .toolbar {
          Button(action: {
            self.processing = true
            let success = session.signOut()
            if(success) {
              self.processing = false
            }
          }) {
            Text("Sign Out")
              .disabled(processing)
          }
        }
      }
    }
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView().environmentObject(SessionStore(session: User.default))
  }
}
