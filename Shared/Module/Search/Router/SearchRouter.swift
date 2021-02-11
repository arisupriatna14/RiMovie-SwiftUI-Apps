//
//  SearchRouter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI
import Resolver
import MovieModule

class SearchRouter {
  
  func makeMovieDetailView(for movie: MovieUIModel) -> some View {
    return DetailView(presenter: Resolver.resolve(), movie: movie)
  }
  
}

extension SearchView {
  func linkBuilderMovieDetail<Content: View>(
    for movie: MovieUIModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: SearchRouter().makeMovieDetailView(for: movie)) {
      content()
    }
  }
}
