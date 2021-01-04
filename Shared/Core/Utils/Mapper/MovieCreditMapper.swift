//
//  MovieCreditMapper.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import Foundation
 
final class MovieCreditMapper {
  
  static func mapMoviesCastResponseToDomains(input moviesCast: [MovieCastResponse]) -> [MovieCastModel] {
    return moviesCast.map {
      return MovieCastModel(
        id: $0.id,
        character: $0.character,
        name: $0.name,
        profilePath: $0.profilePath ?? ""
      )
    }
  }
  
  static func mapMoviesCrewResponseToDomains(input moviesCrew: [MovieCrewResponse]) -> [MovieCrewModel] {
    return moviesCrew.map {
      return MovieCrewModel(
        id: $0.id,
        job: $0.job,
        name: $0.name,
        profilePath: $0.profilePath ?? ""
      )
    }
  }
  
  #if !WIDGET
  static func mapMoviesCastEntityToDomains(input moviesCastEntity: [MovieCastEntity]) -> [MovieCastModel] {
    return moviesCastEntity.map {
      return MovieCastModel(
        id: $0.id,
        character: $0.character,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
  #endif
  
  #if !WIDGET
  static func mapMoviesCrewEntityToDomains(input moviesCrewEntity: [MovieCrewEntity]) -> [MovieCrewModel] {
    return moviesCrewEntity.map {
      return MovieCrewModel(
        id: $0.id,
        job: $0.job,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
  #endif
  
  #if !WIDGET
  static func mapMoviesCrewDomainToEntities(input movieCrewDomains: [MovieCrewModel]) -> [MovieCrewEntity] {
    return movieCrewDomains.map {
      let movieCrewEntity = MovieCrewEntity()
      movieCrewEntity.id = $0.id
      movieCrewEntity.job = $0.job
      movieCrewEntity.name = $0.name
      movieCrewEntity.profilePath = $0.profilePath
      
      return movieCrewEntity
    }
  }
  #endif
  
  #if !WIDGET
  static func mapMoviesCastDomainToEntities(input movieCastDomains: [MovieCastModel]) -> [MovieCastEntity] {
    return movieCastDomains.map {
      let movieCastEntity = MovieCastEntity()
      movieCastEntity.id = $0.id
      movieCastEntity.character = $0.character
      movieCastEntity.name = $0.name
      movieCastEntity.profilePath = $0.profilePath
      
      return movieCastEntity
    }
  }
  #endif
  
  static func mapMoviesCastDomainToPresentations(input movieCastDomains: [MovieCastModel]) -> [MovieCastUIModel] {
    return movieCastDomains.map {
      return MovieCastUIModel(
        id: $0.id,
        character: $0.character,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
  
  static func mapMoviesCrewDomainsToPresentations(input movieCrewDomains: [MovieCrewModel]) -> [MovieCrewUIModel] {
    return movieCrewDomains.map {
      return MovieCrewUIModel(
        id: $0.id,
        job: $0.job,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
  
  static func mapMoviesCastPresentationsToDomains(
    input movieCastPresentations: [MovieCastUIModel]
  ) -> [MovieCastModel] {
    return movieCastPresentations.map {
      return MovieCastModel(
        id: $0.id,
        character: $0.character,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
  
  static func mapMoviesCrewPresentationsToDomains(
    input movieCrewPresentations: [MovieCrewUIModel]
  ) -> [MovieCrewModel] {
    return movieCrewPresentations.map {
      return MovieCrewModel(
        id: $0.id,
        job: $0.job,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
  
}
