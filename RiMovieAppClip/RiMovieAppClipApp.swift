//
//  RiMovieAppClipApp.swift
//  RiMovieAppClip
//
//  Created by Ari Supriatna on 23/12/20.
//

import SwiftUI
import Resolver
import MovieModule

@main
struct RiMovieAppClipApp: App {
  
  @StateObject var homePresenter = MoviesPresenter<MoviesInteractor>(moviesUseCase: Resolver.resolve())
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(homePresenter)
    }
  }
}
