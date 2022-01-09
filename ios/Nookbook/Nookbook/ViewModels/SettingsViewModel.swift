//
//  SettingsViewModel.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/30/21.
//

import Foundation
import Firebase
import FirebaseFirestore

class SettingsViewModel: ObservableObject {
  @Published var island: Island?
  
  func updateSettings() {
    let db = Firestore.firestore()
    db.collection("todos").addDocument(data: ["name": "Raku Isle", "fruit": "Apples"]) { error in
      guard error == nil else {
        return
      }
      print("We added a document!")
      
    }
  }
}

