//
//  Event.swift
//  Nookbook
//
//  Created by Eric Horodyski on 1/11/22.
//

import Foundation
import SwiftUI

struct Event: Decodable, Hashable {
  var event: String
  var date: String
  var type: String
  var url: String
  
  static let `default` = Self(
    event: "Maddie's birthday",
    date: "2022-01-11",
    type: "Birthday",
    url: "https://nookipedia.com/wiki/Maddie"
  )
  
  func getEventTypeImage() -> String {
    switch self.type {
    case "Nook Shopping":
      return "EventTypeShopping"
    case "Recipes":
      return "EventTypeRecipes"
    case "Birthday":
      return "EventTypeBirthday"
    default:
      return "EventTypeEvent"
    }
  }
}
