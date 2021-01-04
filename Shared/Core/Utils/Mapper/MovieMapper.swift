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
      var movieVideos: [MovieVideoModel]?
      var movieCast: [MovieCastModel]?
      var movieCrew: [MovieCrewModel]?
      
      if let results = result.videos?.results {
        movieVideos = MovieVideoMapper.mapMovieVideosResponseToDomains(input: results)
      }
      
      if let casts = result.credits?.cast {
        movieCast = MovieCreditMapper.mapMoviesCastResponseToDomains(input: casts)
      }
      
      if let crews = result.credits?.crew {
        movieCrew = MovieCreditMapper.mapMoviesCrewResponseToDomains(input: crews)
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
    
    var movieVideos: [MovieVideoModel]?
    var movieCast: [MovieCastModel]?
    var movieCrew: [MovieCrewModel]?
    
    if let results = movie.videos?.results {
      movieVideos = MovieVideoMapper.mapMovieVideosResponseToDomains(input: results)
    }
    
    if let crews = movie.credits?.crew {
      movieCrew = MovieCreditMapper.mapMoviesCrewResponseToDomains(input: crews)
    }
    
    if let casts = movie.credits?.cast {
      movieCast = MovieCreditMapper.mapMoviesCastResponseToDomains(input: casts)
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
      videos: movieVideos ?? [.stub],
      cast: movieCast ?? [.stub],
      crew: movieCrew ?? [.stub]
    )
  }
  
  #if !WIDGET
  static func mapMoviesEntitiesToDomains(input moviesEntities: [MovieEntity]) -> [MovieModel] {
    
    return moviesEntities.map { movieEntity in
      
      let movieVideos = MovieVideoMapper.mapMovieVideosEntitiesToDomains(input: Array(movieEntity.videos))
      let movieCast = MovieCreditMapper.mapMoviesCastEntityToDomains(input: Array(movieEntity.cast))
      let movieCrew = MovieCreditMapper.mapMoviesCrewEntityToDomains(input: Array(movieEntity.crew))
      
      return MovieModel(
        id: movieEntity.id,
        backdropPath: movieEntity.backdropPath,
        originalTitle: movieEntity.originalTitle,
        overview: movieEntity.overview,
        popularity: movieEntity.popularity,
        posterPath: movieEntity.posterPath,
        title: movieEntity.title,
        voteAverage: movieEntity.voteAverage,
        voteCount: movieEntity.voteCount,
        videos: movieVideos,
        cast: movieCast,
        crew: movieCrew,
        favorite: movieEntity.favorite
      )
    }
    
  }
  #endif
  
  #if !WIDGET
  static func mapDetailMovieEntityToDomain(input movieEntity: MovieEntity) -> MovieModel {
    
    let movieVideos = MovieVideoMapper.mapMovieVideosEntitiesToDomains(input: Array(movieEntity.videos))
    let movieCast = MovieCreditMapper.mapMoviesCastEntityToDomains(input: Array(movieEntity.cast))
    let movieCrew = MovieCreditMapper.mapMoviesCrewEntityToDomains(input: Array(movieEntity.crew))
    
    return MovieModel(
      id: movieEntity.id,
      backdropPath: movieEntity.backdropPath,
      originalTitle: movieEntity.originalTitle,
      overview: movieEntity.overview,
      popularity: movieEntity.popularity,
      posterPath: movieEntity.posterPath,
      title: movieEntity.title,
      voteAverage: movieEntity.voteAverage,
      voteCount: movieEntity.voteCount,
      videos: movieVideos,
      cast: movieCast,
      crew: movieCrew,
      favorite: movieEntity.favorite
    )
    
  }
  #endif
  
  #if !WIDGET
  static func mapDetailMovieDomainToEntity(input movieDomain: MovieModel) -> MovieEntity {
    
    let movieVideos = MovieVideoMapper.mapMovieVideosDomainsToEntities(input: movieDomain.videos)
    let movieCrew = MovieCreditMapper.mapMoviesCrewDomainToEntities(input: movieDomain.crew)
    let movieCast = MovieCreditMapper.mapMoviesCastDomainToEntities(input: movieDomain.cast)
    
    let movieEntity = MovieEntity()
    movieEntity.id = movieDomain.id
    movieEntity.backdropPath = movieDomain.backdropPath
    movieEntity.originalTitle = movieDomain.originalTitle
    movieEntity.overview = movieDomain.overview
    movieEntity.popularity = movieDomain.popularity
    movieEntity.posterPath = movieDomain.posterPath
    movieEntity.title = movieDomain.title
    movieEntity.voteAverage = movieDomain.voteAverage
    movieEntity.voteCount = movieDomain.voteCount
    movieEntity.videos = movieVideos.toList(ofType: MovieVideoEntity.self)
    movieEntity.cast = movieCast.toList(ofType: MovieCastEntity.self)
    movieEntity.crew = movieCrew.toList(ofType: MovieCrewEntity.self)
    movieEntity.favorite = movieDomain.favorite
    
    return movieEntity
  }
  #endif
  
  static func mapMoviesDomainsToPresentations(input movieDomains: [MovieModel]) -> [MovieUIModel] {
    return movieDomains.map {
      let movieVideos = MovieVideoMapper.mapMovieVideosDomainsToPresentations(input: $0.videos)
      let movieCast = MovieCreditMapper.mapMoviesCastDomainToPresentations(input: $0.cast)
      let movieCrew = MovieCreditMapper.mapMoviesCrewDomainsToPresentations(input: $0.crew)
      
      return MovieUIModel(
        id: $0.id,
        backdropPath: $0.backdropPath,
        originalTitle: $0.originalTitle,
        overview: $0.overview,
        popularity: $0.popularity,
        posterPath: $0.posterPath,
        title: $0.title,
        voteAverage: $0.voteAverage,
        voteCount: $0.voteCount,
        videos: movieVideos,
        cast: movieCast,
        crew: movieCrew,
        favorite: $0.favorite
      )
    }
  }
  
  static func mapDetailMovieDomainToPresentation(input movieDomain: MovieModel) -> MovieUIModel {
    let movieVideos = MovieVideoMapper.mapMovieVideosDomainsToPresentations(input: movieDomain.videos)
    let movieCast = MovieCreditMapper.mapMoviesCastDomainToPresentations(input: movieDomain.cast)
    let movieCrew = MovieCreditMapper.mapMoviesCrewDomainsToPresentations(input: movieDomain.crew)
    
    return MovieUIModel(
      id: movieDomain.id,
      backdropPath: movieDomain.backdropPath,
      originalTitle: movieDomain.originalTitle,
      overview: movieDomain.overview,
      popularity: movieDomain.popularity,
      posterPath: movieDomain.posterPath,
      title: movieDomain.title,
      voteAverage: movieDomain.voteAverage,
      voteCount: movieDomain.voteCount,
      videos: movieVideos,
      cast: movieCast,
      crew: movieCrew,
      favorite: movieDomain.favorite
    )
  }
  
  static func mapDetailMoviePresentationToDomain(input moviePresentation: MovieUIModel) -> MovieModel {
    let movieVideos = MovieVideoMapper.mapMovieVideosPresentationsToDomains(input: moviePresentation.videos)
    let movieCast = MovieCreditMapper.mapMoviesCastPresentationsToDomains(input: moviePresentation.cast)
    let movieCrew = MovieCreditMapper.mapMoviesCrewPresentationsToDomains(input: moviePresentation.crew)
    
    return MovieModel(
      id: moviePresentation.id,
      backdropPath: moviePresentation.backdropPath,
      originalTitle: moviePresentation.originalTitle,
      overview: moviePresentation.overview,
      popularity: moviePresentation.popularity,
      posterPath: moviePresentation.posterPath,
      title: moviePresentation.title,
      voteAverage: moviePresentation.voteAverage,
      voteCount: moviePresentation.voteCount,
      videos: movieVideos,
      cast: movieCast,
      crew: movieCrew,
      favorite: moviePresentation.favorite
    )
  }
  
}
