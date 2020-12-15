//
//  APICall.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation

struct API {
  
  static let baseUrl = "https://api.themoviedb.org/3"
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
    
    public var url: String {
      switch self {
      case .upcoming: return "\(API.baseUrl)/movie/upcoming"
      case .topRated: return "\(API.baseUrl)/movie/top_rated"
      case .popular: return "\(API.baseUrl)/movie/popular"
      case .detail: return "\(API.baseUrl)/movie/"
      case .similarMovie: return "\(API.baseUrl)/movie"
      case .searchMovie: return "\(API.baseUrl)/search/movie"
      }
    }
  }
  
}
