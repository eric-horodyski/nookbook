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
}
