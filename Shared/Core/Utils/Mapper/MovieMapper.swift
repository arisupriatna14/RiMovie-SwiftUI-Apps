//
//  MovieMapper.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation

final class MovieMapper {
  
  static func mapMoviesResponseToDomains(input movies: [MovieResponse]) -> [MovieModel] {
    return movies.map { result in
      
      let movieVideos = result.videos?.results.map {
        return MovieVideoModel(id: $0.id, key: $0.key, name: $0.name, site: $0.site)
      }
      
      let movieCast = result.credits?.cast.map {
        return MovieCastModel(id: $0.id, character: $0.character, name: $0.name, profilePath: $0.profilePath ?? "")
      }
      
      let movieCrew = result.credits?.crew.map {
        return MovieCrewModel(id: $0.id, job: $0.job, name: $0.name, profilePath: $0.profilePath ?? "")
      }
      
      return MovieModel(
        id: result.id,
        backdropPath: result.backdropPath ?? "",
        originalTitle: result.originalTitle ?? "Unknown",
        overview: result.overview ?? "-",
        popularity: result.popularity ?? 0.0,
        posterPath: result.posterPath ?? "",
        title: result.title ?? "Unknown",
        voteAverage: result.voteAverage ?? 0.0,
        voteCount: result.voteCount ?? 0,
        videos: movieVideos ?? [.stub],
        cast: movieCast ?? [.stub],
        crew: movieCrew ?? [.stub]
      )
    }
  }
  
  static func mapDetailMovieResponseToDomains(input movie: MovieResponse) -> MovieModel {
    
    let movieVideo = movie.videos?.results.map {
      return MovieVideoModel(id: $0.id, key: $0.key, name: $0.name, site: $0.site)
    }
    
    let movieCrew = movie.credits?.crew.map {
      return MovieCrewModel(id: $0.id, job: $0.job, name: $0.name, profilePath: $0.profilePath ?? "")
    }
    
    let movieCast = movie.credits?.cast.map {
      return MovieCastModel(id: $0.id, character: $0.character, name: $0.name, profilePath: $0.profilePath ?? "")
    }
    
    return MovieModel(
      id: movie.id,
      backdropPath: movie.backdropPath ?? "",
      originalTitle: movie.originalTitle ?? "Unknown",
      overview: movie.overview ?? "-",
      popularity: movie.popularity ?? 0.0,
      posterPath: movie.posterPath ?? "",
      title: movie.title ?? "Unknown",
      voteAverage: movie.voteAverage ?? 0.0,
      voteCount: movie.voteCount ?? 0,
      videos: movieVideo ?? [.stub],
      cast: movieCast ?? [.stub],
      crew: movieCrew ?? [.stub]
    )
  }
  
}
