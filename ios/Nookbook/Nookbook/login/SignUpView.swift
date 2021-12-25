//
//  SignUpView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/23/21.
//

import SwiftUI
import Firebase

struct SignUpView: View {
  @EnvironmentObject var viewRouter: ViewRouter
  
  @State var email: String = ""
  @State var password: String = ""
  @State var confirmPassword: String = ""
  
  @State var signUpProcessing = false
  @State var signUpErrorMessage = ""
  
  var body: some View {
    ZStack {
      LoginBackground()
      VStack {
        Logo()
        UsernameTextField(label: "Email Address", username: $email)
        PasswordSecureField(label: "Password", password: $password)
        PasswordSecureField(label: "Confirm Password", password: $confirmPassword)
        Button(action: {
          signUpUser(userEmail: email, userPassword: password)
        }) {
          LoginButtonContent(label: "SIGN UP")
        }
        .disabled(!signUpProcessing && !email.isEmpty && !password.isEmpty && !confirmPassword.isEmpty && password == confirmPassword ? false : true)
        if signUpProcessing {
          ProgressView()
        }
        if !signUpErrorMessage.isEmpty {
          Text("Failed creating account: \(signUpErrorMessage)")
            .foregroundColor(.red)
        }
        HStack {
          Text("Already have an account?")
          Button(action: {
            viewRouter.currentRoute = .signInView
          }) {
            Text("Log In")
          }.foregroundColor(Color("PrimaryColor"))
        }
      }
      .padding()
    }
  }
  
  func signUpUser(userEmail: String, userPassword: String) {
    signUpProcessing = true
    Auth.auth().createUser(withEmail: userEmail, password: userPassword) { authResult, error in
      guard error == nil else {
        signUpErrorMessage = error!.localizedDescription
        signUpProcessing = false
        return
      }
      
      switch authResult {
      case .none:
        print("Could not create acount.")
        signUpProcessing = false
      case .some(_):
        print("User created")
        signUpProcessing = false
        viewRouter.currentRoute = .homeView
      }
    }
  }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
