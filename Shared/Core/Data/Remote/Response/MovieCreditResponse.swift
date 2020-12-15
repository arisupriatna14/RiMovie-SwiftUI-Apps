//
//  MovieCreditResponse.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation

struct MovieCreditResponse: Decodable {
  
  let cast: [MovieCastResponse]
  let crew: [MovieCrewResponse]
  
}

struct MovieCrewResponse: Decodable, Identifiable {
  
  private enum CodingKeys: String, CodingKey {
    case id = "id"
    case job = "job"
    case name = "name"
    case profilePath = "profile_path"
  }
  
  let id: Int
  let job: String
  let name: String
  let profilePath: String?
  
}

struct MovieCastResponse: Decodable, Identifiable {
  
  private enum CodingKeys: String, CodingKey {
    case id = "id"
    case character = "character"
    case name = "name"
    case profilePath = "profile_path"
  }
  
  let id: Int
  let character: String
  let name: String
  let profilePath: String?
  
}
