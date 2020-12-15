//
//  Injection.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation

final class Injection: NSObject {
  
  private func provideRepository() -> MovieRepositoryProtocol {
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    
    return MovieRepository.sharedInstace(remote)
  }
  
  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    
    return HomeInteractor(repository: repository)
  }
  
}
