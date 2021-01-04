//
//  FavoritePresenter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI
import Combine

class FavoritePresenter: ObservableObject {
  
  private let router = FavoriteRouter()
  private let favoriteUseCase: FavoriteUseCase
  private var cancellables: Set<AnyCancellable> = []
  
  @Published var isLoadingState: Bool = false
  @Published var movies: [MovieUIModel]?
  @Published var errorMessage: String = ""
  
  init(favoriteUseCase: FavoriteUseCase) {
    self.favoriteUseCase = favoriteUseCase
  }
  
  func getMoviesFavorite() {
    isLoadingState = true
    
    favoriteUseCase.getMoviesFavorite()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { error in
        switch error {
        case .failure:
          self.isLoadingState = false
          self.errorMessage = String(describing: error)
        case .finished:
          self.isLoadingState = false
        }
      }, receiveValue: { result in
        self.movies = result
      })
      .store(in: &cancellables)
  }
  
  func linkBuilderMovieDetail<Content: View>(
    for movie: MovieUIModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: router.makeMovieDetailView(for: movie)) {
      content()
    }
  }
  
}
