//
//  MovieCreditModel.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation

struct MovieCrewModel: Equatable, Identifiable {
  
  let id: Int
  let job: String
  let name: String
  let profilePath: String
  
  var profilePathURL: URL {
    return URL(string: "https://image.tmdb.org/t/p/w500\(profilePath)")!
  }
  
}

struct MovieCastModel: Equatable, Identifiable {
  
  let id: Int
  let character: String
  let name: String
  let profilePath: String
  
  var profilePathURL: URL {
    return URL(string: "https://image.tmdb.org/t/p/w500\(profilePath)")!
  }
  
}

extension MovieCrewModel {
  
  static var stub: MovieCrewModel {
    .init(id: 0, job: "Director", name: "Joe Nussbaum", profilePath: "/24TedWAIXRxhjVh9SNwlWGUeuMp.jpg")
  }
  
}

extension MovieCastModel {
  
  static var stub: MovieCastModel {
    .init(
      id: 2560614,
      character: "Nory Boxwood Horace",
      name: "Izabela Rose",
      profilePath: "/p6TY55Yzq0cGyeSzzB2zFTzhvCf.jpg"
    )
  }
  
}
