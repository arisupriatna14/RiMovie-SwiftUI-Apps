//
//  RiMovieApp.swift
//  Shared
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI
import Resolver

@main
struct RiMovieApp: App {
  
  @StateObject var homePresenter = HomePresenter(homeUseCase: Resolver.resolve())
  @StateObject var searchPresenter = SearchPresenter(searchUseCase: Resolver.resolve())
  @StateObject var favoritePresenter = FavoritePresenter(favoriteUseCase: Resolver.resolve())
  @StateObject var aboutPresenter = AboutPresenter(aboutUseCase: Resolver.resolve())
  
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
