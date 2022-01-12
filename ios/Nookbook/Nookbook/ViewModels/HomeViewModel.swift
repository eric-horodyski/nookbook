//
//  HomeViewModel.swift
//  Nookbook
//
//  Created by Eric Horodyski on 1/11/22.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
  private let url = "https://api.nookipedia.com/nh"
  private var task: AnyCancellable?
  private var apiKey: String
  
  @Published var events: [Event] = []
  
  init(apiKey: String) {
    self.apiKey = apiKey
    self.events = [Event.default]
  }
  
  func fetchEvents() {
    let path = "/events?date=today"
    var request = URLRequest(url: URL(string: url + path)!)
    request.addValue(self.apiKey, forHTTPHeaderField: "X-API-KEY")
    request.addValue("2.0.0", forHTTPHeaderField: "Accept-Version")
    
    task = URLSession.shared.dataTaskPublisher(for: request)
      .map { $0.data }
      .decode(type: [Event].self, decoder: JSONDecoder())
      .replaceError(with: [])
      .eraseToAnyPublisher()
      .receive(on: RunLoop.main)
      .assign(to: \HomeViewModel.events, on: self)
  }
}
