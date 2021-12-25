//
//  LoginComponents.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/23/21.
//

import SwiftUI

struct LoginButtonContent: View {
  var label: String
  
  var body: some View {
    Text(label)
      .font(.headline)
      .foregroundColor(Color.white)
      .padding()
      .frame(width: 220, height: 60)
      .background(Color("SecondaryColor"))
      .cornerRadius(15.0)
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

struct UsernameTextField: View {
  var label: String
  @Binding var username: String
  
  var body: some View {
    return TextField(label, text: $username)
      .padding()
      .background(Color.white)
      .cornerRadius(5.0)
      .padding(.bottom, 10)
  }
}

struct PasswordSecureField: View {
  var label: String
  @Binding var password: String
  
  var body: some View {
    return SecureField(label, text: $password)
      .padding()
      .background(Color.white)
      .cornerRadius(5.0)
      .padding(.bottom, 10)
  }
}
