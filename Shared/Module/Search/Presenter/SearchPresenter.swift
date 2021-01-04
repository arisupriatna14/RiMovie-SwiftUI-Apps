//
//  SearchPresenter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 21/12/20.
//

import SwiftUI
import Combine

class SearchPresenter: ObservableObject {
  
  private let router = SearchRouter()
  private let searchUseCase: SearchUseCase
  private var cancellables: Set<AnyCancellable> = []
  private var subscriptionToken: AnyCancellable?
  
  @Published var query: String = ""
  @Published var isLoadingState = false
  @Published var errorMessage: String = ""
  @Published var movies: [MovieUIModel]?
  
  init(searchUseCase: SearchUseCase) {
    self.searchUseCase = searchUseCase
  }
  
  deinit {
    self.subscriptionToken?.cancel()
    self.subscriptionToken = nil
  }
  
  var isEmptyResult: Bool {
    return !self.query.isEmpty && self.movies != nil && self.movies!.isEmpty
  }
  
  func startObserve() {
    self.subscriptionToken = self.$query.map {
      self.movies = nil
      
      return $0
    }
    .throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
    .sink { self.searchMovies(by: $0) }
  }
  
  func searchMovies(by query: String) {
    
    guard !query.isEmpty else { return }
    
    isLoadingState = true
    
    self.searchUseCase.searchMovies(by: query)
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
