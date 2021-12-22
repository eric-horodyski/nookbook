//
//  ContentView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/22/21.
//

import SwiftUI

struct ContentView: View {
  @State var username: String = ""
  @State var password: String = ""
  
  var body: some View {
    ZStack {
      LoginBackground()
      VStack {
        Logo()
        TextField("Username", text: $username)
          .padding()
          .background(Color.white)
          .cornerRadius(5.0)
          .padding(.bottom, 20)
        SecureField("Password", text: $password)
          .padding()
          .background(Color.white)
          .cornerRadius(5.0)
          .padding(.bottom, 20)
        Button(action: { print("Button tapped") }) {
          LoginButtonContent()
        }
      }
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct LoginBackground: View {
  var body: some View {
    VStack {
      Spacer()
      Image("LoginBackground")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding(.bottom, 30)
        .background(Color("AccentColor"))
    }
    .ignoresSafeArea()
    .background(Color("LoginBackgroundColor"))
  }
}

struct Logo: View {
  var body: some View {
    Image("Logo")
      .padding(.bottom, 20)
  }
}

struct LoginButtonContent: View {
  var body: some View {
    Text("LOGIN")
      .font(.headline)
      .foregroundColor(Color.white)
      .padding()
      .frame(width: 220, height: 60)
      .background(Color("SecondaryColor"))
      .cornerRadius(15.0)
  }
}
