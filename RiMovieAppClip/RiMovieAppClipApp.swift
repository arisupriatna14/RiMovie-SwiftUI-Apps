//
//  RiMovieAppClipApp.swift
//  RiMovieAppClip
//
//  Created by Ari Supriatna on 23/12/20.
//

import SwiftUI

@main
struct RiMovieAppClipApp: App {
  
  @StateObject var homePresenter = HomePresenter(homeUseCase: Injection().provideHome())
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(homePresenter)
    }
  }
}
