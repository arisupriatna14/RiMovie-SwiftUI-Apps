//
//  Injection.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation
import RealmSwift
import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    registerCoreServices()
    registerHomeServices()
    registerDetailServices()
  }
}

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
  
}

//final class Injection: NSObject {
  
//  private func provideRepository() -> MovieRepositoryProtocol {
//    let realm = try? Realm()
//
//    let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
//    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
//
//    return MovieRepository.sharedInstace(locale, remote)
//  }
  
//  #if !APPCLIP
//  private func provideUserRepository() -> UserRepositoryProtocol {
//    return UserRepository.sharedInstance
//  }
//  #endif
  
//  func provideHome() -> HomeUseCase {
////    let repository = provideRepository()
//
//    return HomeInteractor(repository: Resolver.resolve())
//  }
  
//  func provideDetail(for movie: MovieUIModel) -> DetailUseCase {
////    let repository = provideRepository()
//
//    return DetailInteractor(repository: Resolver.resolve(), movie: movie)
//  }
  
//  #if !APPCLIP
//  func provideSearch() -> SearchUseCase {
////    let repository = provideRepository()
//
//    return SearchInteractor(repository: Resolver.resolve())
//  }
//  #endif
  
//  #if !APPCLIP
//  func provideAbout() -> AboutUseCase {
////    let repository = provideUserRepository()
//
//    return AboutInteractor(repository: Resolver.resolve())
//  }
//  #endif
//
//  #if !APPCLIP
//  func provideFavorite() -> FavoriteUseCase {
////    let repository = provideRepository()
//
//    return FavoriteInteractor(repository: Resolver.resolve())
//  }
//  #endif
  
//}
