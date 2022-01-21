//
//  UserView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/29/21.
//

import SwiftUI

struct SettingsView: View {
  @EnvironmentObject var session: SessionStore
    
  @State var processing: Bool = false
  @State var name: String = Island.default.name
  @State var fruit: Fruit = .Apples
  
  var body: some View {
    
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
    }
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
