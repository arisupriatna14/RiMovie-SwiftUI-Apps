//
//  FavoriteInteractor.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import Combine

protocol FavoriteUseCase {
  
  func getMoviesFavorite() -> AnyPublisher<[MovieUIModel], Error>
  
}

class FavoriteInteractor: FavoriteUseCase {
  
  private let repository: MovieRepositoryProtocol
  
  required init(repository: MovieRepositoryProtocol) {
    self.repository = repository
  }
  
  func getMoviesFavorite() -> AnyPublisher<[MovieUIModel], Error> {
    repository.getMoviesFavorite()
      .map { MovieMapper.mapMoviesDomainsToPresentations(input: $0) }
      .eraseToAnyPublisher()
  }
  
}
