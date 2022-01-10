//
//  UserView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/29/21.
//

import SwiftUI

struct SettingsView: View {
  @EnvironmentObject var session: SessionStore
  
  @ObservedObject var viewModel = SettingsViewModel()
  
  @State var processing: Bool = false
  @State var name: String = Island.default.name
  @State var fruit: Fruit = .Apples
  
  var body: some View {
    NavigationView {
      ZStack {
        Color("BackgroundColor").ignoresSafeArea()
        VStack{
          List {
            Section(header: Text("Island Information")) {
              HStack {
                Text("Island Name:").fontWeight(.semibold)
                Spacer()
                TextField("Island Name", text: $name)
              }
              Section {
                Picker("Native Fruit", selection: $fruit) {
                  ForEach(Fruit.allCases, id: \.self) { value in
                    Text(value.localizedName).tag(value)
                  }
                }
              }
            }
          }.onAppear {
            UITableView.appearance().backgroundColor = .clear
          }
        }
        .listStyle(GroupedListStyle())
        .toolbar {
          Button(action: {
            self.processing = true
            let success = session.signOut()
            if(success) {
              self.processing = false
            }
          }) {
            Text("Sign Out")
          }
        }
      }
    }.navigationViewStyle(StackNavigationViewStyle())
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView().environmentObject(SessionStore(session: User.default))
  }
}
