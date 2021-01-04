//
//  SearchInteractor.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 21/12/20.
//

import Foundation
import Combine

protocol SearchUseCase {
  
  func searchMovies(by keyword: String) -> AnyPublisher<[MovieUIModel], Error>
  
}

class SearchInteractor: SearchUseCase {
  
  private let repository: MovieRepositoryProtocol
  
  required init(repository: MovieRepositoryProtocol) {
    self.repository = repository
  }
  
  func searchMovies(by keyword: String) -> AnyPublisher<[MovieUIModel], Error> {
    repository.searchMovies(by: keyword)
      .map { MovieMapper.mapMoviesDomainsToPresentations(input: $0) }
      .eraseToAnyPublisher()
  }
}
