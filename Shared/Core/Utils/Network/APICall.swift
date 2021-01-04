//
//  APICall.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation

struct API {
  
  static var baseUrlComponents: URLComponents {
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "api.themoviedb.org"
    return urlComponents
  }
  
  static let apiKey = "36adf8fb1b647a43ba002734ade56b85"
  
}

protocol Endpoint {
  
  var url: String { get }
  
}

enum Endpoints {
  
  enum Gets: Endpoint {
    case upcoming
    case topRated
    case detail
    case popular
    case similarMovie
    case searchMovie
    case nowPlaying
    
    public var url: String {
      switch self {
      case .upcoming: return "/3/movie/upcoming"
      case .topRated: return "/3/movie/top_rated"
      case .popular: return "/3/movie/popular"
      case .detail: return "/3/movie"
      case .similarMovie: return "/3/movie"
      case .searchMovie: return "/3/search/movie"
      case .nowPlaying: return "/3/movie/now_playing"
      }
    }
  }
  
}

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
}
