//
//  HomeRouter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 16/12/20.
//

import SwiftUI
import Resolver

class HomeRouter {
  
  func makeMovieDetailView(for movie: MovieUIModel) -> some View {
    let presenter = DetailPresenter(detailUseCase: Resolver.resolve())
    
    return DetailView(presenter: presenter, movie: movie)
  }
  
}
