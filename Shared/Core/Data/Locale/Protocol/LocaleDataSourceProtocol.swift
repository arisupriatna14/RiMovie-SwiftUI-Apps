//
//  LocaleDataSourceProtocol.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 05/01/21.
//

import Combine

protocol LocaleDataSourceProtocol {
  
  func getMoviesFavorite() -> AnyPublisher<[MovieEntity], Error>
  func getMovie(by movieId: Int) -> AnyPublisher<MovieEntity, Error>
  func addMovie(from movie: MovieEntity) -> AnyPublisher<Bool, Error>
  func updateMovieFavorite(by movieId: Int) -> AnyPublisher<MovieEntity, Error>
  
}
