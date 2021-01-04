//
//  RemoteDataSourceProtocol.swift
//  RiMovie
//
//  Created by Ari Supriatna on 05/01/21.
//

import Combine

protocol RemoteDataSourceProtocol {
  
  func fetchMovies(from endpoint: Endpoints.Gets) -> AnyPublisher<[MovieResponse], Error>
  func getMovieSimilar(by movieId: Int) -> AnyPublisher<[MovieResponse], Error>
  func fetchMovie(by movieId: Int) -> AnyPublisher<MovieResponse, Error>
  func searchMovies(by keyword: String) -> AnyPublisher<[MovieResponse], Error>
  
}
