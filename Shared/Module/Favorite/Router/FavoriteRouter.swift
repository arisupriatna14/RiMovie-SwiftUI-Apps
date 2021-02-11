//
//  FavoriteRouter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI
import Resolver
import MovieModule

class FavoriteRouter {
  
  func makeMovieDetailView(for movie: MovieUIModel) -> some View {
    return DetailView(presenter: Resolver.resolve(), movie: movie)
  }
  
}
