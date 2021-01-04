//
//  MovieVideoMapper.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import Foundation

final class MovieVideoMapper {
  
  static func mapMovieVideosResponseToDomains(input movieVideos: [MovieVideoResponse]) -> [MovieVideoModel] {
    return movieVideos.map { result in
      return MovieVideoModel(id: result.id, key: result.key, name: result.name, site: result.site)
    }
  }
  
  #if !WIDGET
  static func mapMovieVideosEntitiesToDomains(input movieVideos: [MovieVideoEntity]) -> [MovieVideoModel] {
    return movieVideos.map { result in
      return MovieVideoModel(id: result.id, key: result.key, name: result.name, site: result.site)
    }
  }
  #endif
  
  #if !WIDGET
  static func mapMovieVideosDomainsToEntities(input movieVideosDomain: [MovieVideoModel]) -> [MovieVideoEntity] {
    return movieVideosDomain.map {
      let movieVideoEntity = MovieVideoEntity()
      movieVideoEntity.id = $0.id
      movieVideoEntity.key = $0.key
      movieVideoEntity.name = $0.name
      movieVideoEntity.site = $0.site
      
      return movieVideoEntity
    }
  }
  #endif
  
  static func mapMovieVideosDomainsToPresentations(input movieVideosDomains: [MovieVideoModel]) -> [MovieVideoUIModel] {
    return movieVideosDomains.map { result in
      return MovieVideoUIModel(id: result.id, key: result.key, name: result.name, site: result.site)
    }
  }
  
  static func mapMovieVideosPresentationsToDomains(
    input movieVideosPresentations: [MovieVideoUIModel]
  ) -> [MovieVideoModel] {
    return movieVideosPresentations.map {
      return MovieVideoModel(id: $0.id, key: $0.key, name: $0.name, site: $0.site)
    }
  }
}
