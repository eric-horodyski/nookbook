//
//  User.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/28/21.
//

import Foundation

struct User {
  var uid: String
  var email: String
  var idToken: String
  
  static let `default` = Self(
    uid: "478454",
    email: "eric@ionic.io",
    idToken: "eyJhbGciOiJSUzI1NiIsImtpZCI6IjFkMmE2YTZhNDcyYWNhNjNmM2FmNzU2NjIxZjM0"
  )
  
  init(uid: String, email: String, idToken: String) {
    self.uid = uid
    self.email = email
    self.idToken = idToken
  }
}
