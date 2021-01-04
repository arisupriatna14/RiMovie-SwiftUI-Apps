//
//  ContentView.swift
//  Shared
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var homePresenter: HomePresenter
  @EnvironmentObject var searchPresenter: SearchPresenter
  @EnvironmentObject var favoritePresenter: FavoritePresenter
  @EnvironmentObject var aboutPresenter: AboutPresenter
  
  var body: some View {
    TabView {
      NavigationView {
        HomeView(presenter: homePresenter)
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .tabItem {
        Image(systemName: "play.circle.fill")
        Text("Watch Now")
      }
      
      NavigationView {
        FavoriteView(presenter: favoritePresenter)
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .tabItem {
        Image(systemName: "heart.circle.fill")
        Text("Favorite")
      }
      
      SearchView(presenter: searchPresenter)
        .tabItem {
          Image(systemName: "magnifyingglass.circle.fill")
          Text("Search")
        }
      
      NavigationView {
        AboutView(presenter: aboutPresenter)
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .tabItem {
        Image(systemName: "person.crop.circle.fill")
        Text("About")
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
