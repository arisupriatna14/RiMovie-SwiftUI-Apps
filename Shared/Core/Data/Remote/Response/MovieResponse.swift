//
//  MovieResponse.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation

struct MoviesResponse: Decodable {
  
  let results: [MovieResponse]
  
}

struct MovieResponse: Decodable {
  
  private enum CodingKeys: String, CodingKey {
    case id = "id"
    case backdropPath = "backdrop_path"
    case originalTitle = "original_title"
    case overview = "overview"
    case popularity = "popularity"
    case posterPath = "poster_path"
    case title = "title"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
    case videos = "videos"
    case credits = "credits"
  }
  
  let id: Int
  let backdropPath: String?
  let originalTitle: String?
  let overview: String?
  let popularity: Double?
  let posterPath: String?
  let title: String?
  let voteAverage: Double?
  let voteCount: Int?
  let videos: MovieVideosResponse?
  let credits: MovieCreditResponse?
  
}
