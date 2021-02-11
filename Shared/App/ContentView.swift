//
//  ContentView.swift
//  Shared
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI
import Resolver

struct ContentView: View {
  
  @State private var selection: String = "home"

  var body: some View {
    TabView(selection: $selection) {
      NavigationView {
        HomeView(presenter: Resolver.resolve())
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .tabItem {
        Image(systemName: "play.circle.fill")
        Text("Watch Now")
      }
      .tag("home")
      
      NavigationView {
        FavoriteView(presenter: Resolver.resolve())
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .tabItem {
        Image(systemName: "heart.circle.fill")
        Text("Favorite")
      }
      .tag("favorite")
      
      SearchView(presenter: Resolver.resolve())
        .tabItem {
          Image(systemName: "magnifyingglass.circle.fill")
          Text("Search")
        }
        .tag("search")
      
      NavigationView {
        AboutView(presenter: Resolver.resolve())
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .tabItem {
        Image(systemName: "person.crop.circle.fill")
        Text("About")
      }
      .tag("about")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
