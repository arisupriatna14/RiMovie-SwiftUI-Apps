//
//  DetailPresenter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 16/12/20.
//

import SwiftUI
import Combine

class DetailPresenter: ObservableObject {
  
  private let router = DetailRouter()
  private let detailUseCase: DetailUseCase
  private var cancellables: Set<AnyCancellable> = []
  
  @Published var isLoadingState = false
//  @Published var movie: MovieUIModel
  @Published var similarMovie: [MovieUIModel]?
  @Published var detailMovie: MovieUIModel?
  @Published var errorMessage: String = ""
  
  // MARK: Favorite
  @Published var isAddedSuccessfully: Bool?
  @Published var updateFavoriteMovie: MovieUIModel?
  @Published var movieFavorite: MovieUIModel?
  
  init(detailUseCase: DetailUseCase) {
    self.detailUseCase = detailUseCase
//    movie = detailUseCase.getMovie()
  }
  
  func getMovie(movieId: Int) {
    isLoadingState = true
    
    detailUseCase.getDetailMovie(by: movieId)
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
        self.detailMovie = result
      })
      .store(in: &cancellables)
  }
  
  func getMovieSimilar(movieId: Int) {
    isLoadingState = true
    
    detailUseCase.getMovieSimilar(by: movieId)
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
        self.similarMovie = result
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
  
  func addMovieToFavorite(movie: MovieUIModel) {
    detailUseCase.addMovieToFavorite(by: movie)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { error in
        switch error {
        case .failure:
          self.errorMessage = String(describing: error)
        case .finished:
          debugPrint("Add Movie to Favorite is Finished!")
        }
      }, receiveValue: { isSuccess in
        self.isAddedSuccessfully = isSuccess
        if isSuccess {
          self.updateMovieFavorite(movieId: movie.id)
        }
      })
      .store(in: &cancellables)
  }
  
  func getMovieFavorite(movieId: Int) {
    detailUseCase.getMovieFavorite(by: movieId)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { error in
        switch error {
        case .failure:
          self.errorMessage = String(describing: error)
        case .finished:
          debugPrint("Get Movie Favorite is Finished!")
        }
      }, receiveValue: { result in
        self.movieFavorite = result
      })
      .store(in: &cancellables)
  }
  
  func updateMovieFavorite(movieId: Int) {
    detailUseCase.updateFavoriteMovie(by: movieId)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { error in
        switch error {
        case .failure:
          self.errorMessage = String(describing: error)
        case .finished:
          debugPrint("Update Favorite is Finished!")
        }
      }, receiveValue: { result in
        self.movieFavorite = result
      })
      .store(in: &cancellables)
  }
  
}
