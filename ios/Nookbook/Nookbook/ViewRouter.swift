//
//  ViewRouter.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/23/21.
//

import SwiftUI

class ViewRouter: ObservableObject {
  @Published var currentRoute: Route = .signInView
}

enum Route {
  case signUpView
  case signInView
  case homeView
}
