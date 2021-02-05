//
//  MovieRepository.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation
import Combine

//final class MovieRepository: NSObject {
//
//  typealias MovieInstance = (LocaleDataSource, RemoteDataSource) -> MovieRepository
//
//  fileprivate let locale: LocaleDataSource
//  fileprivate let remote: RemoteDataSource
//
//  private init(locale: LocaleDataSource, remote: RemoteDataSource) {
//    self.locale = locale
//    self.remote = remote
//  }
//
//  static let sharedInstace: MovieInstance = { localeRepo, remoteRepo in
//    return MovieRepository(locale: localeRepo, remote: remoteRepo)
//  }
//
//}

class MovieRepository: MovieRepositoryProtocol {
  
  private let locale: LocaleDataSourceProtocol
  private let remote: RemoteDataSourceProtocol
  
  init(locale: LocaleDataSourceProtocol, remote: RemoteDataSourceProtocol) {
    self.locale = locale
    self.remote = remote
  }

  func getMoviesFavorite() -> AnyPublisher<[MovieModel], Error> {
    self.locale.getMoviesFavorite()
      .map { MovieMapper.mapMoviesEntitiesToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func updateFavoriteMovie(by movieId: Int) -> AnyPublisher<MovieModel, Error> {
    self.locale.updateMovieFavorite(by: movieId)
      .map { MovieMapper.mapDetailMovieEntityToDomain(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getMovieFavorite(by movieId: Int) -> AnyPublisher<MovieModel, Error> {
    self.locale.getMovie(by: movieId)
      .map { MovieMapper.mapDetailMovieEntityToDomain(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func addMovieToFavorite(from movie: MovieModel) -> AnyPublisher<Bool, Error> {
    self.locale.addMovie(from: MovieMapper.mapDetailMovieDomainToEntity(input: movie))
  }
  
  func getMovies(from endpoint: Endpoints.Gets) -> AnyPublisher<[MovieModel], Error> {
    self.remote.fetchMovies(from: endpoint)
      .map { MovieMapper.mapMoviesResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getMovieSimilar(by movieId: Int) -> AnyPublisher<[MovieModel], Error> {
    self.remote.getMovieSimilar(by: movieId)
      .map { MovieMapper.mapMoviesResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getMovie(by movieId: Int) -> AnyPublisher<MovieModel, Error> {
    self.remote.fetchMovie(by: movieId)
      .map { MovieMapper.mapDetailMovieResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func searchMovies(by keyword: String) -> AnyPublisher<[MovieModel], Error> {
    self.remote.searchMovies(by: keyword)
      .map { MovieMapper.mapMoviesResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
}
