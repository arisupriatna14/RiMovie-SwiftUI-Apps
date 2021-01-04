//
//  Injection.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
  
  private func provideRepository() -> MovieRepositoryProtocol {
    let realm = try? Realm()
    
    let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance

    return MovieRepository.sharedInstace(locale, remote)
  }
  
  #if !APPCLIP
  private func provideUserRepository() -> UserRepositoryProtocol {
    return UserRepository.sharedInstance
  }
  #endif
  
  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    
    return HomeInteractor(repository: repository)
  }
  
  func provideDetail(for movie: MovieUIModel) -> DetailUseCase {
    let repository = provideRepository()
    
    return DetailInteractor(repository: repository, movie: movie)
  }
  
  #if !APPCLIP
  func provideSearch() -> SearchUseCase {
    let repository = provideRepository()
    
    return SearchInteractor(repository: repository)
  }
  #endif
  
  #if !APPCLIP
  func provideAbout() -> AboutUseCase {
    let repository = provideUserRepository()
    
    return AboutInteractor(repository: repository)
  }
  #endif
  
  #if !APPCLIP
  func provideFavorite() -> FavoriteUseCase {
    let repository = provideRepository()
    
    return FavoriteInteractor(repository: repository)
  }
  #endif
  
}
