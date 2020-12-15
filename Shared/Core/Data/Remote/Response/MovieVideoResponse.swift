//
//  MovieVideoResponse.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation

struct MovieVideosResponse: Decodable {
  
  let results: [MovieVideoResponse]
  
}

struct MovieVideoResponse: Identifiable, Decodable {
  
  let id: String
  let key: String
  let name: String
  let site: String

}
