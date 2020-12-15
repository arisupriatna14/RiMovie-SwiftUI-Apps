//
//  MovieVideoModel.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation

struct MovieVideoModel: Equatable, Identifiable {
  
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

extension MovieVideoModel {
  
  static var stub: MovieVideoModel {
    .init(id: "0", key: "TUyqi_vEcsE", name: "Teaser ✨ | Upside Down Magic | Disney Channel", site: "YouTube")
  }
  
}
