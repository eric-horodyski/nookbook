//
//  User.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/28/21.
//

import Foundation

struct User {
  var uid: String
  var email: String?
  var displayName: String?
  
  static let `default` = Self(
    uid: "478454",
    displayName: "Eric Horodyski",
    email: "eric@ionic.io"
  )
  
  init(uid: String, displayName: String?, email: String?) {
    self.uid = uid
    self.email = email
    self.displayName = displayName
  }
}
