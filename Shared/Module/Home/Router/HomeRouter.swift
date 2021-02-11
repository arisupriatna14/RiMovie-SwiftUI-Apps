//
//  HomeRouter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 16/12/20.
//

import SwiftUI
import Resolver
import MovieModule

class HomeRouter {
  
  func makeMovieDetailView(for movie: MovieUIModel) -> some View {
    return DetailView(presenter: Resolver.resolve(), movie: movie)
  }
  
}

extension HomeView {

  func linkBuilderMovieDetail<Content: View>(
    for movie: MovieUIModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: HomeRouter().makeMovieDetailView(for: movie)) {
      content()
    }
  }

}
