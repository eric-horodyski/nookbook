//
//  SignInView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/23/21.
//

import SwiftUI

struct LoginView: View {
  @EnvironmentObject var session: SessionStore
  
  @State var email: String = ""
  @State var password: String = ""
  @State var error: String = ""
  @State var processing: Bool = false
  @State var signUpMode: Bool = false
  
  var body: some View {
    ZStack {
      NBLoginBackground()
      VStack {
        NBLogo()
        if !error.isEmpty {
          NBError(error: error)
        }
        NBEmailField(email: $email)
        NBPasswordField(label: "Password", password: $password)
        Button(action: {
          signUpMode
            ? handleSignUp(email: email, password: password)
            : handleSignIn(email: email, password: password)
        }) {
          Text(signUpMode ? "SIGN UP" : "LOGIN")
        }
        .buttonStyle(NBButtonStyle(disabled: !processing && !email.isEmpty && !password.isEmpty ? false : true))
        HStack {
          Text(signUpMode ? "Already have an account?" : "Don't have an account?")
          Button(action: {
            self.signUpMode = !self.signUpMode
          }) {
            Text(signUpMode ? "Sign In" : "Sign Up")
          }.foregroundColor(Color("PrimaryColor"))
        }
      }.padding()
    }
  }
  
  func handleSignIn(email: String, password: String) {
    self.processing = true
    session.signIn(email: email, password: password) { (result, error) in
      self.processing = false
      guard error == nil else {
        self.error = error!.localizedDescription
        return
      }
    }
  }
  
  func handleSignUp(email: String, password: String) {
    self.processing = true
    session.signUp(email: email, password: password) { (result, error) in
      self.processing = false
      guard error == nil else {
        self.error = error!.localizedDescription
        return
      }
    }
  }
  
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
      LoginView().environmentObject(SessionStore())
    }
}
