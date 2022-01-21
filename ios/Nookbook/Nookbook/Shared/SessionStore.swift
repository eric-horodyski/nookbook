//
//  SessionStore.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/28/21.
//

import SwiftUI
import Firebase
import Combine

struct CustomTokenResponse: Decodable {
  let jwt: String
  let apiKey: String
}

class SessionStore: ObservableObject {
  var didChange = PassthroughSubject<SessionStore, Never>()
  @Published var session: User? { didSet { self.didChange.send(self)}}
  var handle: AuthStateDidChangeListenerHandle?
  
  init(session: User? = nil) {
    self.session = session
  }
  
  func listen() {
    handle = Auth.auth().addStateDidChangeListener { (auth, user) in
      guard let user = user else {
        self.session = nil
        return
      }
      user.getIDTokenForcingRefresh(true) { (idToken, error) in
        guard let idToken = idToken else {
          self.session = nil
          return
        }
        self.getAdditionalAuthData(idToken: idToken) { (token) in
          guard let token = token else {
            return
          }
          self.session = User(uid: user.uid, email: user.email!, token: token.jwt, apiKey: token.apiKey)
        }
      }
    }
  }
  
  func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
    Auth.auth().createUser(withEmail: email, password: password, completion: handler)
  }
  
  func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
    Auth.auth().signIn(withEmail: email, password: password, completion: handler)
  }
  
  func signOut () {
    do {
      try Auth.auth().signOut()
      self.session = nil
    } catch {
      return
    }
  }
  
  func unbind () {
    if let handle = handle {
      Auth.auth().removeStateDidChangeListener(handle)
    }
  }
  
  func getAdditionalAuthData(idToken: String, withCompletion completion: @escaping(CustomTokenResponse?) -> Void) {
    guard let url = URL(string: "https://nookbook-auth.herokuapp.com/authorize") else {
      return
    }
    var request = URLRequest(url: url)
    request.addValue("Bearer \(idToken)", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) { (data, _, _) -> Void in
      guard let data = data else {
        DispatchQueue.main.async { completion(nil) }
        return
      }
      let wrapper = try? JSONDecoder().decode(CustomTokenResponse.self, from: data)
      DispatchQueue.main.async { completion(wrapper) }
    }
    task.resume()
  }
}



