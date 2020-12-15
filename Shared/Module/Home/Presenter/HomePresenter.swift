//
//  HomePresenter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  private let homeUseCase: HomeUseCase
  private var cancellables: Set<AnyCancellable> = []
  
  @Published var isLoadingState = false
  @Published var movieUpcoming: [MovieModel]?
  @Published var moviePopular: [MovieModel]?
  @Published var movieTopRated: [MovieModel]?
  @Published var errorMessage: String = ""
  
  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }
  
  func getMovieUpcoming() {
    isLoadingState = true
    
    homeUseCase.getMovieUpcoming()
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
        self.movieUpcoming = result
      })
      .store(in: &cancellables)
  }
  
  func getMovieTopRated() {
    isLoadingState = true
    
    homeUseCase.getMovieTopRated()
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
        self.movieTopRated = result
      })
      .store(in: &cancellables)
  }
  
  func getMoviePopular() {
    isLoadingState = true
    
    homeUseCase.getMoviePopular()
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
        self.moviePopular = result
      })
      .store(in: &cancellables)
  }
}
