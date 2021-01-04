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
  @Published var movie: MovieUIModel
  @Published var similarMovie: [MovieUIModel]?
  @Published var detailMovie: MovieUIModel?
  @Published var errorMessage: String = ""
  
  // MARK: Favorite
  @Published var isAddedSuccessfully: Bool?
  @Published var updateFavoriteMovie: MovieUIModel?
  @Published var movieFavorite: MovieUIModel?
  
  init(detailUseCase: DetailUseCase) {
    self.detailUseCase = detailUseCase
    movie = detailUseCase.getMovie()
  }
  
  func getMovie() {
    isLoadingState = true
    
    detailUseCase.getDetailMovie()
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
  
  func getMovieSimilar() {
    isLoadingState = true
    
    detailUseCase.getMovieSimilar()
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
  
  func addMovieToFavorite() {
    detailUseCase.addMovieToFavorite()
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
          self.updateMovieFavorite()
        }
      })
      .store(in: &cancellables)
  }
  
  func getMovieFavorite() {
    detailUseCase.getMovieFavorite()
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
  
  func updateMovieFavorite() {
    detailUseCase.updateFavoriteMovie()
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
