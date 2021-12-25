//
//  SignInView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/23/21.
//

import SwiftUI
import Firebase

struct SignInView: View {
  @EnvironmentObject var viewRouter: ViewRouter
  
  @State var email: String = ""
  @State var password: String = ""
  
  @State var signInProcessing = false
  @State var signInErrorMessage = ""
  
  var body: some View {
    ZStack {
      LoginBackground()
      VStack {
        Logo()
        UsernameTextField(label: "Email Address", username: $email)
        PasswordSecureField(label: "Password", password: $password)
        Button(action: {
          signInUser(userEmail: email, userPassword: password)
        }) {
          LoginButtonContent(label: "LOGIN")
        }
        .disabled(!signInProcessing && !email.isEmpty && !password.isEmpty ? false : true)
        if signInProcessing {
          ProgressView()
        }
        if !signInErrorMessage.isEmpty {
          Text("Failed creating account: \(signInErrorMessage)")
            .foregroundColor(.red)
        }
        HStack {
          Text("Don't have an account?")
          Button(action: {
            viewRouter.currentRoute = .signUpView
          }) {
            Text("Sign Up")
          }.foregroundColor(Color("PrimaryColor"))
        }
      }
      .padding()
    }
  }
  
  func signInUser(userEmail: String, userPassword: String) {
    signInProcessing = true
    Auth.auth().signIn(withEmail: userEmail, password: userPassword) { authResult, error in
      guard error == nil else {
        signInProcessing = false
        signInErrorMessage = error!.localizedDescription
        return
      }
      switch authResult {
      case .none:
        print("Could not sign in user.")
        signInProcessing = false
      case .some(_):
        print("User signed in")
        signInProcessing = false
        withAnimation {
          viewRouter.currentRoute = .homeView
        }
      }
    }
  }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
