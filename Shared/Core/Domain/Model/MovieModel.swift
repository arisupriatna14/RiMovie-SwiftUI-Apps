//
//  MovieModel.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation

struct MovieModel: Equatable, Identifiable {
  
  let id: Int
  let backdropPath: String
  let originalTitle: String
  let overview: String
  let popularity: Double
  let posterPath: String
  let title: String
  let voteAverage: Double
  let voteCount: Int
  let videos: [MovieVideoModel]
  let cast: [MovieCastModel]
  let crew: [MovieCrewModel]
  
  var backdropPathURL: URL {
    return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath)")!
  }
  
  var posterPathURL: URL {
    return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")!
  }
  
  var youtubeTrailers: [MovieVideoModel]? {
    videos.filter { $0.youtubeURL != nil }
  }
  
}
