//
//  Injection.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation
import RealmSwift
import Resolver
import RiMovieCore
import MovieModule
import SearchModule
import AboutModule

extension Resolver {
  
  static func registerAllMapperServices() {
    register {
      MovieMapper()
    }
    
    register {
      MovieDetailMapper()
    }
  }
  
  static func registerAllRepositoryServices() {
    register {
      MoviesRepository(remote: resolve(), mapper: resolve())
    }
    
    register {
      MovieRepository(remote: resolve(), mapper: resolve())
    }
    
    register {
      MovieSimilarRepository(remote: resolve(), mapper: resolve())
    }
    
    register {
      MoviesFavoriteRepository(locale: resolve(), mapper: resolve())
    }
    
    register {
      MovieFavoriteRepository(locale: resolve(), mapper: resolve())
    }
    
    register {
      UpdateFavoriteRepository(locale: resolve(), mapper: resolve())
    }
    
    register {
      AddFavoriteRepository(locale: resolve(), mapper: resolve())
    }
    
    #if !APPCLIP
    register {
      SearchRepository(remote: resolve(), mapper: resolve())
    }
    
    register {
      AboutRepository() as AboutRepositoryProtocol
    }
    #endif
  }
  
  static func registerCoreServices() {
    register {
      GetMoviesRemoteDataSource()
    }
    
    register {
      GetMovieRemoteDataSource(endpoint: Endpoints.Gets.detail.url)
    }
    
    register {
      GetMovieSimilarRemoteDataSource(endpoint: Endpoints.Gets.similarMovie.url)
    }
    
    register {
      SearchMovieRemoteDataSource(endpoint: Endpoints.Gets.searchMovie.url)
    }
    
    register {
      FavoriteMovieLocaleDataSource(realm: try? Realm())
    }
  }
  
  static func registerHomeServices() {
    register {
      MoviesPresenter<MoviesInteractor>(moviesUseCase: resolve())
    }

    register {
      MoviesInteractor(repository: resolve())
    }
  }
  
  static func registerDetailServices() {
    register {
      DetailMoviePresenter<
        MovieInteractor,
        MovieSimilarInteractor,
        AddMovieFavoriteInteractor,
        MovieFavoriteInteractor,
        UpdateMovieFavoriteInteractor
      >(
        movieUseCase: resolve(),
        movieSimilarUseCase: resolve(),
        addFavoriteUseCase: resolve(),
        getFavoriteUseCase: resolve(),
        updateFavoriteUseCase: resolve()
      )
    }

    register {
      MovieInteractor(repository: resolve())
    }
    
    register {
      MovieSimilarInteractor(repository: resolve())
    }
    
    register {
      AddMovieFavoriteInteractor(repository: resolve())
    }
    
    register {
      MovieFavoriteInteractor(repository: resolve())
    }
    
    register {
      UpdateMovieFavoriteInteractor(repository: resolve())
    }
  }
  
  #if !APPCLIP
  static func registerSearchServices() {
    register {
      SearchPresenter<String, MovieUIModel, SearchInteractor>(useCase: resolve())
    }

    register {
      SearchInteractor(repository: resolve())
    }
  }
  
  static func registerAboutServices() {
    register {
      AboutPresenter(useCase: resolve())
    }

    register {
      AboutInteractor(repository: resolve()) as AboutUseCase
    }
  }
  
  static func registerFavoriteServices() {
    register {
      MoviesFavoritePresenter(useCase: resolve())
    }
    
    register {
      MoviesFavoriteInteractor(repository: resolve())
    }
  }
  #endif
  
}
