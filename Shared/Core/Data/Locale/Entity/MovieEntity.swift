//
//  MovieEntity.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import Foundation
import RealmSwift

class MovieEntity: Object {
  @objc dynamic var id = 0
  @objc dynamic var backdropPath = ""
  @objc dynamic var originalTitle = ""
  @objc dynamic var overview = ""
  @objc dynamic var popularity = 0.0
  @objc dynamic var posterPath = ""
  @objc dynamic var title = ""
  @objc dynamic var voteAverage = 0.0
  @objc dynamic var voteCount = 0
  @objc dynamic var favorite = false
  
  var videos = List<MovieVideoEntity>()
  var cast = List<MovieCastEntity>()
  var crew = List<MovieCrewEntity>()
  
  override class func primaryKey() -> String? {
    return "id"
  }
}
