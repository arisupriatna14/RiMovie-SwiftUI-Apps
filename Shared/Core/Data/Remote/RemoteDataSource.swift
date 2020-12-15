//
//  RemoteDataSource.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation
import Combine
import Alamofire

protocol RemoteDataSourceProtocol {
  
  func getMovieUpcoming() -> AnyPublisher<[MovieResponse], Error>
  func getMovieTopRated() -> AnyPublisher<[MovieResponse], Error>
  func getMoviePopular() -> AnyPublisher<[MovieResponse], Error>
  func getMovieSimilar(by movieId: Int) -> AnyPublisher<[MovieResponse], Error>
  func getDetailMovie(by movieId: Int) -> AnyPublisher<MovieResponse, Error>
  func searchMovie(by keyword: String) -> AnyPublisher<[MovieResponse], Error>
  
}

final class RemoteDataSource: NSObject {
  
  private override init() { }
  
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  func getMovieUpcoming() -> AnyPublisher<[MovieResponse], Error> {
    return Future<[MovieResponse], Error> { completion in
      
      guard let url = URL(string: "\(Endpoints.Gets.upcoming)?api_key=\(API.apiKey)&language=en-US&page=1") else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: MoviesResponse.self) { response in
          switch response.result {
          case .success(let movies):
            completion(.success(movies.results))
          case .failure:
            completion(.failure(MovieError.invalidResponse))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
  func getMovieTopRated() -> AnyPublisher<[MovieResponse], Error> {
    return Future<[MovieResponse], Error> { completion in
      
      guard let url = URL(string: "\(Endpoints.Gets.topRated)?api_key=\(API.apiKey)&language=en-US&page=1") else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: MoviesResponse.self) { response in
          switch response.result {
          case .success(let movies):
            completion(.success(movies.results))
          case .failure:
            completion(.failure(MovieError.invalidResponse))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
  func getMoviePopular() -> AnyPublisher<[MovieResponse], Error> {
    return Future<[MovieResponse], Error> { completion in
      
      guard let url = URL(string: "\(Endpoints.Gets.popular)?api_key=\(API.apiKey)&language=en-US&page=1") else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: MoviesResponse.self) { response in
          switch response.result {
          case .success(let movies):
            completion(.success(movies.results))
          case .failure:
            completion(.failure(MovieError.invalidResponse))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
  func getMovieSimilar(by movieId: Int) -> AnyPublisher<[MovieResponse], Error> {
    return Future<[MovieResponse], Error> { completion in
      
      guard let url = URL(string: "\(Endpoints.Gets.similarMovie)/\(movieId)/similar?api_key=\(API.apiKey)&language=en-US&page=1") else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: MoviesResponse.self) { response in
          switch response.result {
          case .success(let movies):
            completion(.success(movies.results))
          case .failure:
            completion(.failure(MovieError.invalidResponse))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
  func getDetailMovie(by movieId: Int) -> AnyPublisher<MovieResponse, Error> {
    return Future<MovieResponse, Error> { completion in
      
      guard let url = URL(string: "\(Endpoints.Gets.detail)/\(movieId)?api_key=\(API.apiKey)&language=en-US&page=1") else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: MovieResponse.self) { response in
          switch response.result {
          case .success(let movie):
            completion(.success(movie))
          case .failure:
            completion(.failure(MovieError.invalidResponse))
          }
        }
    }.eraseToAnyPublisher()
  }
  
  func searchMovie(by keyword: String) -> AnyPublisher<[MovieResponse], Error> {
    return Future<[MovieResponse], Error> { completion in
      
      guard let url = URL(string: "\(Endpoints.Gets.searchMovie)?api_key=\(API.apiKey)&language=en-US&query=\(keyword)&page=1&include_adult=false") else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: MoviesResponse.self) { response in
          switch response.result {
          case .success(let movies):
            completion(.success(movies.results))
          case .failure:
            completion(.failure(MovieError.invalidResponse))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
}
