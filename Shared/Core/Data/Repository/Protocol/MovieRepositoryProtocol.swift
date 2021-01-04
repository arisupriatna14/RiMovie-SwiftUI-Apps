//
//  MovieRepositoryProtocol.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 05/01/21.
//

import Combine

protocol MovieRepositoryProtocol {
  
  func getMovies(from endpoint: Endpoints.Gets) -> AnyPublisher<[MovieModel], Error>
  func getMovieSimilar(by movieId: Int) -> AnyPublisher<[MovieModel], Error>
  func getMovie(by movieId: Int) -> AnyPublisher<MovieModel, Error>
  func searchMovies(by keyword: String) -> AnyPublisher<[MovieModel], Error>
  
  func getMoviesFavorite() -> AnyPublisher<[MovieModel], Error>
  func updateFavoriteMovie(by movieId: Int) -> AnyPublisher<MovieModel, Error>
  func getMovieFavorite(by movieId: Int) -> AnyPublisher<MovieModel, Error>
  func addMovieToFavorite(from movie: MovieModel) -> AnyPublisher<Bool, Error>
  
}
