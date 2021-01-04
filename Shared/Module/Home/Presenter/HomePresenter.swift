//
//  HomePresenter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
  
  private let router = HomeRouter()
  private let homeUseCase: HomeUseCase
  private var cancellables: Set<AnyCancellable> = []
  
  @Published var isLoadingState = false
  @Published var movieUpcoming: [MovieUIModel]?
  @Published var moviePopular: [MovieUIModel]?
  @Published var movieTopRated: [MovieUIModel]?
  @Published var movieNowPlaying: [MovieUIModel]?
  @Published var errorMessage: String = ""
  
  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }
  
  func getMovies(with endpoint: Endpoints.Gets) {
    isLoadingState = true
    
    homeUseCase.getMovies(from: endpoint)
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
        switch endpoint {
        case .nowPlaying:
          self.movieNowPlaying = result
        case .popular:
          self.moviePopular = result
        case .topRated:
          self.movieTopRated = result
        case .upcoming:
          self.movieUpcoming = result
        default:
          debugPrint("Wrong endpoint")
        }
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
