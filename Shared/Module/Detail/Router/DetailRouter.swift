//
//  DetailRouter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 21/12/20.
//

import SwiftUI
import Resolver

class DetailRouter {
  
  func makeMovieDetailView(for movie: MovieUIModel) -> some View {
    let presenter = DetailPresenter(detailUseCase: Resolver.resolve())
    
    return DetailView(presenter: presenter, movie: movie)
  }
  
}
