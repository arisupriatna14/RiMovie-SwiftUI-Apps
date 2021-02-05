//
//  Injection.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation
import RealmSwift
import Resolver

extension Resolver {
  
  static func registerCoreServices() {
    register {
      RemoteDataSource() as RemoteDataSourceProtocol
    }
    register {
      LocaleDataSource(realm: try? Realm.init()) as LocaleDataSourceProtocol
    }
    register {
      MovieRepository(locale: resolve(), remote: resolve()) as MovieRepositoryProtocol
    }
    #if !APPCLIP
    register {
      UserRepository() as UserRepositoryProtocol
    }
    #endif
  }
  
  static func registerHomeServices() {
    register {
      HomePresenter(homeUseCase: resolve())
    }
    register {
      HomeInteractor(repository: resolve()) as HomeUseCase
    }
  }
  
  static func registerDetailServices() {
    register {
      DetailPresenter(detailUseCase: resolve())
    }
    register {
      DetailInteractor(repository: resolve()) as DetailUseCase
    }
  }
  
  #if !APPCLIP
  static func registerSearchServices() {
    register {
      SearchPresenter(searchUseCase: resolve())
    }
    register {
      SearchInteractor(repository: resolve()) as SearchUseCase
    }
  }
  
  static func registerAboutServices() {
    register {
      AboutPresenter(aboutUseCase: resolve())
    }
    register {
      AboutInteractor(repository: resolve()) as AboutUseCase
    }
  }
  
  static func registerFavoriteServices() {
    register {
      FavoritePresenter(favoriteUseCase: resolve())
    }
    register {
      FavoriteInteractor(repository: resolve()) as FavoriteUseCase
    }
  }
  #endif
  
}
