//
//  Island.swift
//  Nookbook
//
//  Created by Eric Horodyski on 12/29/21.
//

import Foundation

enum Fruit: CustomStringConvertible {
  case Apples
  case Cherries
  case Oranges
  case Peaches
  case Pears
  
  var description: String {
    switch self {
    case .Apples: return "Apples"
    case .Cherries: return "Cherries"
    case .Oranges: return "Oranges"
    case .Peaches: return "Peaches"
    case .Pears: return "Pears"
    }
  }
}

struct Island {
  var name: String
  var fruit: Fruit
  
  static let `default` = Self(
    name: "Raku Isle",
    fruit: Fruit.Oranges
  )
}
