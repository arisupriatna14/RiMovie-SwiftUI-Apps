//
//  RemoteDataSource.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation
import Combine
import Alamofire

final class RemoteDataSource: NSObject {
  
  private override init() { }
  
  static let sharedInstance: RemoteDataSource = RemoteDataSource()
  
}

extension RemoteDataSource: RemoteDataSourceProtocol {
  
  func fetchMovies(from endpoint: Endpoints.Gets) -> AnyPublisher<[MovieResponse], Error> {
    return Future<[MovieResponse], Error> { completion in
      
      var urlComponents = API.baseUrlComponents
      urlComponents.path = endpoint.url
      urlComponents.setQueryItems(with: [
        "api_key": API.apiKey,
        "language": "en-US",
        "page": "1"
      ])
      
      guard let url = urlComponents.url else { return }
      
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
      
      var urlComponents = API.baseUrlComponents
      urlComponents.path = "\(Endpoints.Gets.similarMovie.url)/\(movieId)/similar"
      urlComponents.setQueryItems(with: [
        "api_key": API.apiKey,
        "language": "en-US",
        "page": "1"
      ])
      
      guard let url = urlComponents.url else { return }
      
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
  
  func fetchMovie(by movieId: Int) -> AnyPublisher<MovieResponse, Error> {
    return Future<MovieResponse, Error> { completion in
      
      var urlComponents = API.baseUrlComponents
      urlComponents.path = "\(Endpoints.Gets.detail.url)/\(movieId)"
      urlComponents.setQueryItems(with: [
        "api_key": API.apiKey,
        "language": "en-US",
        "page": "1",
        "append_to_response": "videos,credits"
      ])
      
      guard let url = urlComponents.url else { return }
      
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
  
  func searchMovies(by keyword: String) -> AnyPublisher<[MovieResponse], Error> {
    return Future<[MovieResponse], Error> { completion in
      
      var urlComponents = API.baseUrlComponents
      urlComponents.path = Endpoints.Gets.searchMovie.url
      urlComponents.setQueryItems(with: [
        "api_key": API.apiKey,
        "language": "en-US",
        "query": keyword,
        "page": "1",
        "include_adult": "false"
      ])
      
      guard let url = urlComponents.url else { return }
      
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
