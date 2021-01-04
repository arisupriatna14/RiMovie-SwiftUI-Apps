//
//  MovieCreditEntity.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import Foundation
import RealmSwift

class MovieCrewEntity: Object {
  
  @objc dynamic var id = 0
  @objc dynamic var job = ""
  @objc dynamic var name = ""
  @objc dynamic var profilePath = ""
  
}

class MovieCastEntity: Object {
  
  @objc dynamic var id = 0
  @objc dynamic var character = ""
  @objc dynamic var name = ""
  @objc dynamic var profilePath = ""
  
}
