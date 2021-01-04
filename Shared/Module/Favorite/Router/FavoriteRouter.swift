//
//  FavoriteRouter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI

class FavoriteRouter {
  
  func makeMovieDetailView(for movie: MovieUIModel) -> some View {
    let detailUseCase = Injection.init().provideDetail(for: movie)
    let presenter = DetailPresenter(detailUseCase: detailUseCase)
    
    return DetailView(presenter: presenter, movie: movie)
  }
  
}
