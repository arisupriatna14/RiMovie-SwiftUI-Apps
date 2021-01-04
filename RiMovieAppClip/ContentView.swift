//
//  ContentView.swift
//  RiMovieAppClip
//
//  Created by Ari Supriatna on 23/12/20.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var homePresenter: HomePresenter
  
  var body: some View {
    NavigationView {
      HomeView(presenter: homePresenter)
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
