//
//  HomeView.swift
//  Nookbook
//
//  Created by Eric Horodyski on 1/10/22.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var router: TabsRouter
  @ObservedObject var viewModel: HomeViewModel
  
  init(apiKey: String) {
    self.viewModel = HomeViewModel(apiKey: apiKey)
  }
  
  var body: some View {
    GeometryReader { metrics in
      ZStack {
        Color("BackgroundColor").ignoresSafeArea()
        HStack(alignment: .top) {
          VStack(alignment: .leading) {
            NBTodaysEvents(metrics: metrics, viewModel: viewModel)
            FavoriteVillagers
            Spacer()
          }
        }
      }
    }
  }
  
  var FavoriteVillagers: some View {
    VStack {
      Text("Favorite Villagers")
        .font(.title)
        .bold()
        .padding([.bottom])
      Button(action: {
        router.currentTab = .villagers
      }) {
        Text("Let's make some friends")
      }
    }.padding()
  }
  
  
}



struct NBTodaysEvents: View {
  var metrics: GeometryProxy
  var viewModel: HomeViewModel
  
  init(metrics: GeometryProxy, viewModel: HomeViewModel) {
    self.metrics = metrics
    self.viewModel = viewModel
   
  }
  

  var body: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading) {
        Text("Northern Hemisphere")
          .font(.subheadline)
        NBDateTime()
      }
      .padding([.top, .horizontal])
      
      if(viewModel.events.isEmpty) {
        HStack(alignment: .center) {
          Spacer()
          Text("There are no events on the island today.")
          Spacer()
        }.padding()
        
        
      } else {
        ScrollView(.horizontal) {
          HStack(spacing: 1) {
            ForEach(viewModel.events, id: \.self) { event in
              NBEventCard(event: event, width: metrics.size.width * 0.9)
            }
          }
        }
      }
    }.onAppear {
      viewModel.fetchEvents()
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(apiKey: User.default.apiKey)
      .environmentObject(TabsRouter())
  }
}
