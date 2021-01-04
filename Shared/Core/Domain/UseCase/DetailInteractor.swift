//
//  DetailInteractor.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 16/12/20.
//

import Foundation
import Combine

protocol DetailUseCase {
  
  func getDetailMovie() -> AnyPublisher<MovieUIModel, Error>
  func getMovie() -> MovieUIModel
  func getMovieSimilar() -> AnyPublisher<[MovieUIModel], Error>
  func updateFavoriteMovie() -> AnyPublisher<MovieUIModel, Error>
  func getMovieFavorite() -> AnyPublisher<MovieUIModel, Error>
  func addMovieToFavorite() -> AnyPublisher<Bool, Error>
  
}

class DetailInteractor: DetailUseCase {
  
  private let repository: MovieRepositoryProtocol
  private let movie: MovieUIModel
  
  required init(repository: MovieRepositoryProtocol, movie: MovieUIModel) {
    self.repository = repository
    self.movie = movie
  }
  
  func getDetailMovie() -> AnyPublisher<MovieUIModel, Error> {
    repository.getMovie(by: movie.id)
      .map { MovieMapper.mapDetailMovieDomainToPresentation(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getMovie() -> MovieUIModel {
    return movie
  }
  
  func getMovieSimilar() -> AnyPublisher<[MovieUIModel], Error> {
    repository.getMovieSimilar(by: movie.id)
      .map { MovieMapper.mapMoviesDomainsToPresentations(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func updateFavoriteMovie() -> AnyPublisher<MovieUIModel, Error> {
    repository.updateFavoriteMovie(by: movie.id)
      .map { MovieMapper.mapDetailMovieDomainToPresentation(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getMovieFavorite() -> AnyPublisher<MovieUIModel, Error> {
    repository.getMovieFavorite(by: movie.id)
      .map { MovieMapper.mapDetailMovieDomainToPresentation(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func addMovieToFavorite() -> AnyPublisher<Bool, Error> {
    return repository.addMovieToFavorite(from: MovieMapper.mapDetailMoviePresentationToDomain(input: movie))
  }
  
}
