//
//  RiMovieApp.swift
//  Shared
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI

@main
struct RiMovieApp: App {
  
  @StateObject var homePresenter = HomePresenter(homeUseCase: Injection().provideHome())
  @StateObject var searchPresenter = SearchPresenter(searchUseCase: Injection().provideSearch())
  @StateObject var favoritePresenter = FavoritePresenter(favoriteUseCase: Injection().provideFavorite())
  @StateObject var aboutPresenter = AboutPresenter(aboutUseCase: Injection().provideAbout())
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(homePresenter)
        .environmentObject(searchPresenter)
        .environmentObject(aboutPresenter)
        .environmentObject(favoritePresenter)
    }
  }
}
