//
//  Island.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/29/21.
//

import Foundation
import SwiftUI

enum Fruit: String, Equatable, CaseIterable {
  case Apples = "Apples"
  case Cherries = "Cherries"
  case Oranges = "Oranges"
  case Peaches = "Peaches"
  case Pears = "Pears"
  
  var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

struct Island {
  var name: String
  var fruit: Fruit
  
  static let `default` = Self(
    name: "Raku Isle",
    fruit: Fruit.Oranges
  )
}
