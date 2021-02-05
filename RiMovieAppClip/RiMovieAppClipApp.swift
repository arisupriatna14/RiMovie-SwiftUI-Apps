//
//  RiMovieAppClipApp.swift
//  RiMovieAppClip
//
//  Created by Ari Supriatna on 23/12/20.
//

import SwiftUI
import Resolver

@main
struct RiMovieAppClipApp: App {
  
  @StateObject var homePresenter = HomePresenter(homeUseCase: Resolver.resolve())
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(homePresenter)
    }
  }
}
