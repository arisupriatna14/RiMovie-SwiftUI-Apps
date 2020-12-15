//
//  HomeInteractor.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation
import Combine

protocol HomeUseCase {
  
  func getMovieUpcoming() -> AnyPublisher<[MovieModel], Error>
  func getMovieTopRated() -> AnyPublisher<[MovieModel], Error>
  func getMoviePopular() -> AnyPublisher<[MovieModel], Error>
  
}

class HomeInteractor: HomeUseCase {
  
  private let repository: MovieRepositoryProtocol
  
  required init(repository: MovieRepositoryProtocol) {
    self.repository = repository
  }
  
  func getMovieUpcoming() -> AnyPublisher<[MovieModel], Error> {
    return repository.getMovieUpcoming()
  }
  
  func getMovieTopRated() -> AnyPublisher<[MovieModel], Error> {
    return repository.getMovieTopRated()
  }
  
  func getMoviePopular() -> AnyPublisher<[MovieModel], Error> {
    return repository.getMoviePopular()
  }
  
}
