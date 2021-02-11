//
//  ContentView.swift
//  RiMovieAppClip
//
//  Created by Ari Supriatna on 23/12/20.
//

import SwiftUI
import MovieModule
import Resolver

struct ContentView: View {
  
  var body: some View {
    NavigationView {
      HomeView(presenter: Resolver.resolve())
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }

}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
