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
  var favorite: Bool = false
  
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

extension MovieModel {
  
  static var stub: MovieModel {
    .init(
      id: 0,
      backdropPath: "/cjaOSjsjV6cl3uXdJqimktT880L.jpg",
      originalTitle: "The Croods: A New Age",
      overview: """
        After leaving their cave, the Croods encounter their biggest threat since leaving:\n
        another family called the Bettermans, who claim and show to be better and evolved.
        Grug grows suspicious of the Betterman parents, Phil and Hope, as they secretly plan to break
        up his daughter Eep with her loving boyfriend Guy to ensure that their daughter Dawn has a loving
        and smart partner to protect her.
      """,
      popularity: 1500,
      posterPath: "/4n8QNNdk4BOX9Dslfbz5Dy6j1HK.jpg",
      title: "The Croods: A New Age",
      voteAverage: 0.0,
      voteCount: 0,
      videos: [.stub],
      cast: [.stub],
      crew: [.stub]
    )
  }
  
}
