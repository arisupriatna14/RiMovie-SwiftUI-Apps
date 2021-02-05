//
//  SearchRouter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI
import Resolver

class SearchRouter {
  
  func makeMovieDetailView(for movie: MovieUIModel) -> some View {
//    let detailUseCase = Injection.init().provideDetail(for: movie)
    let presenter = DetailPresenter(detailUseCase: Resolver.resolve())
    
    return DetailView(presenter: presenter, movie: movie)
  }
  
}
