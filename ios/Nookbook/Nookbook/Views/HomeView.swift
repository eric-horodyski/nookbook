//
//  HomeView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 1/10/22.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var viewModel: HomeViewModel
  
  init(apiKey: String) {
    self.viewModel = HomeViewModel(apiKey: apiKey)
  }
  
  var body: some View {
    GeometryReader { metrics in
      NavigationView{
        ZStack {
          Color("BackgroundColor").ignoresSafeArea()
          VStack(alignment: .leading) {
            NBHeading(label: "Today's Events")
            ScrollView(.horizontal) {
              HStack(spacing: 15) {
                ForEach(viewModel.events, id: \.self) { event in
                  NBEventCard(event: event, width: metrics.size.width * 0.9)
                }
                .padding()
              }
            }
            
            
            
            Spacer()
          }
          .navigationBarItems(leading: NBNavigationBarLeading())
          
        }.onAppear {
          viewModel.fetchEvents()
        }
      }
    }
  }
}

struct NBEventCard: View {
  var event: Event
  var width: CGFloat
  
  var body: some View {
    
    ZStack {
      Color.white
        .cornerRadius(8.0)
      Text(event.event)
    }
    .frame(width: width, height: 200)
    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(apiKey: User.default.apiKey)
  }
}
