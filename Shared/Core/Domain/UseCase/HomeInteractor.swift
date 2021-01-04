//
//  HomeInteractor.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation
import Combine

protocol HomeUseCase {
  
  func getMovies(from endpoint: Endpoints.Gets) -> AnyPublisher<[MovieUIModel], Error>
  
}

class HomeInteractor: HomeUseCase {
  
  private let repository: MovieRepositoryProtocol
  
  required init(repository: MovieRepositoryProtocol) {
    self.repository = repository
  }
  
  func getMovies(from endpoint: Endpoints.Gets) -> AnyPublisher<[MovieUIModel], Error> {
    repository.getMovies(from: endpoint)
      .map { MovieMapper.mapMoviesDomainsToPresentations(input: $0) }
      .eraseToAnyPublisher()
  }
  
}
