//
//  DetailInteractor.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 16/12/20.
//

import Foundation
import Combine

protocol DetailUseCase {
  
  func getDetailMovie(by movieId: Int) -> AnyPublisher<MovieUIModel, Error>
  func getMovieSimilar(by movieId: Int) -> AnyPublisher<[MovieUIModel], Error>
  func updateFavoriteMovie(by movieId: Int) -> AnyPublisher<MovieUIModel, Error>
  func getMovieFavorite(by movieId: Int) -> AnyPublisher<MovieUIModel, Error>
  func addMovieToFavorite(by movie: MovieUIModel) -> AnyPublisher<Bool, Error>
  
}

class DetailInteractor: DetailUseCase {
  
  private let repository: MovieRepositoryProtocol
  
  required init(repository: MovieRepositoryProtocol) {
    self.repository = repository
  }
  
  func getDetailMovie(by movieId: Int) -> AnyPublisher<MovieUIModel, Error> {
    repository.getMovie(by: movieId)
      .map { MovieMapper.mapDetailMovieDomainToPresentation(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getMovieSimilar(by movieId: Int) -> AnyPublisher<[MovieUIModel], Error> {
    repository.getMovieSimilar(by: movieId)
      .map { MovieMapper.mapMoviesDomainsToPresentations(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func updateFavoriteMovie(by movieId: Int) -> AnyPublisher<MovieUIModel, Error> {
    repository.updateFavoriteMovie(by: movieId)
      .map { MovieMapper.mapDetailMovieDomainToPresentation(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getMovieFavorite(by movieId: Int) -> AnyPublisher<MovieUIModel, Error> {
    repository.getMovieFavorite(by: movieId)
      .map { MovieMapper.mapDetailMovieDomainToPresentation(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func addMovieToFavorite(by movie: MovieUIModel) -> AnyPublisher<Bool, Error> {
    return repository.addMovieToFavorite(from: MovieMapper.mapDetailMoviePresentationToDomain(input: movie))
  }
  
}
