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
  var token: String
  var apiKey: String
  
  static let `default` = Self(
    uid: "478454",
    email: "eric@ionic.io",
    token: "eyJhbGciOiJSUzI1NiIsImtpZCI6IjFkMmE2YTZhNDcyYWNhNjNmM2FmNzU2NjIxZjM0",
    apiKey: "12345678-abcd-ef12-3456-78901234567"
  )
  
  init(uid: String, email: String, token: String, apiKey: String) {
    self.uid = uid
    self.email = email
    self.token = token
    self.apiKey = apiKey
  }
}
