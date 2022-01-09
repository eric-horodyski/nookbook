//
//  SessionStore.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/28/21.
//

import SwiftUI
import Firebase
import Combine

class SessionStore: ObservableObject {
  var didChange = PassthroughSubject<SessionStore, Never>()
  @Published var session: User? { didSet { self.didChange.send(self)}}
  var handle: AuthStateDidChangeListenerHandle?
  
  init(session: User? = nil) {
    self.session = session
  }
  
  func listen() {
    handle = Auth.auth().addStateDidChangeListener { (auth, user) in
      if let user = user {
        user.getIDTokenForcingRefresh(true) { (idToken, error) in
          if let idToken = idToken {
            print(idToken)
            self.getAdditionalAuthData(idToken: idToken)
            self.session = User(uid: user.uid, email: user.email!, idToken: idToken)
          } else {
            self.session = nil
          }
        }
      } else {
        self.session = nil
      }
    }
  }
  
  func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
    Auth.auth().createUser(withEmail: email, password: password, completion: handler)
  }
  
  func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
    Auth.auth().signIn(withEmail: email, password: password, completion: handler)
  }
  
  func signOut () -> Bool {
    do {
      try Auth.auth().signOut()
      self.session = nil
      return true
    } catch {
      return false
    }
  }
  
  func unbind () {
    if let handle = handle {
      Auth.auth().removeStateDidChangeListener(handle)
    }
  }
  
  func getAdditionalAuthData(idToken: String) {
    guard let url = URL(string: "https://nookbook-auth.herokuapp.com/authorize") else {
      return
    }
    var request = URLRequest(url: url)
    request.addValue("Bearer \(idToken)", forHTTPHeaderField: "Authorization")
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
      if let data = data {
        do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       data, options: [])
                print(jsonResponse) //Response result
             } catch let parsingError {
                print("Error", parsingError)
           }
      }
      
    }
        task.resume()
  }
}


struct TestResponse: Decodable {
  let jwt: String
  let apiKey: String
}
