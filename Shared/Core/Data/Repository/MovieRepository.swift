//
//  MovieRepository.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation
import Combine

protocol MovieRepositoryProtocol {
  
  func getMovieUpcoming() -> AnyPublisher<[MovieModel], Error>
  func getMovieTopRated() -> AnyPublisher<[MovieModel], Error>
  func getMoviePopular() -> AnyPublisher<[MovieModel], Error>
  func getMovieSimilar(by movieId: Int) -> AnyPublisher<[MovieModel], Error>
  func getDetailMovie(by movieId: Int) -> AnyPublisher<MovieModel, Error>
  func searchMovie(by keyword: String) -> AnyPublisher<[MovieModel], Error>
  
}

final class MovieRepository: NSObject {
  
  typealias MovieInstance = (RemoteDataSource) -> MovieRepository
  
  fileprivate let remote: RemoteDataSource
  
  private init(remote: RemoteDataSource) {
    self.remote = remote
  }
  
  static let sharedInstace: MovieInstance = { remoteRepo in
    return MovieRepository(remote: remoteRepo)
  }
  
}

extension MovieRepository: MovieRepositoryProtocol {
  func getMovieUpcoming() -> AnyPublisher<[MovieModel], Error> {
    self.remote.getMovieUpcoming()
      .map { MovieMapper.mapMoviesResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getMovieTopRated() -> AnyPublisher<[MovieModel], Error> {
    self.remote.getMovieTopRated()
      .map { MovieMapper.mapMoviesResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getMoviePopular() -> AnyPublisher<[MovieModel], Error> {
    self.remote.getMoviePopular()
      .map { MovieMapper.mapMoviesResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getMovieSimilar(by movieId: Int) -> AnyPublisher<[MovieModel], Error> {
    self.remote.getMovieSimilar(by: movieId)
      .map { MovieMapper.mapMoviesResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func getDetailMovie(by movieId: Int) -> AnyPublisher<MovieModel, Error> {
    self.remote.getDetailMovie(by: movieId)
      .map { MovieMapper.mapDetailMovieResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  func searchMovie(by keyword: String) -> AnyPublisher<[MovieModel], Error> {
    self.remote.searchMovie(by: keyword)
      .map { MovieMapper.mapMoviesResponseToDomains(input: $0) }
      .eraseToAnyPublisher()
  }
  
  
}
