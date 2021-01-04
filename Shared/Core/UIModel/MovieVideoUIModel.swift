//
//  MovieVideoUIModel.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 29/12/20.
//

import Foundation

struct MovieVideoUIModel: Equatable, Identifiable {
  
  let id: String
  let key: String
  let name: String
  let site: String
  
  var youtubeURL: URL? {
    guard site == "YouTube" else {
      return nil
    }
    
    return URL(string: "https://youtube.com/watch?v=\(key)")
  }
  
}

extension MovieVideoUIModel {
  
  static var stub: MovieVideoUIModel {
    .init(id: "0", key: "TUyqi_vEcsE", name: "Teaser ✨ | Upside Down Magic | Disney Channel", site: "YouTube")
  }
  
}
