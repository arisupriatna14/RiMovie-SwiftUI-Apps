//
//  LocaleDataSource.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import Foundation
import Combine
import RealmSwift

//final class LocaleDataSource: NSObject {
//
//  private let realm: Realm?
//
//  private init(realm: Realm?) {
//    self.realm = realm
//  }
//
//  static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
//    return LocaleDataSource(realm: realmDatabase)
//  }
//}

class LocaleDataSource: LocaleDataSourceProtocol {
  
  private let realm: Realm?
  
  init(realm: Realm?) {
    self.realm = realm
  }
  
  func getMoviesFavorite() -> AnyPublisher<[MovieEntity], Error> {
    return Future<[MovieEntity], Error> { completion in
      if let realm = self.realm {
        let movieEntities = {
          realm.objects(MovieEntity.self)
            .filter("favorite = \(true)")
            .sorted(byKeyPath: "title", ascending: true)
        }()
        completion(.success(movieEntities.toArray(ofType: MovieEntity.self)))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  func getMovie(by movieId: Int) -> AnyPublisher<MovieEntity, Error> {
    return Future<MovieEntity, Error> { completion in
      if let realm = self.realm {
        let movieEntity: Results<MovieEntity> = {
          realm.objects(MovieEntity.self)
            .filter("id = \(movieId)")
        }()
        
        guard let movie = movieEntity.first else {
          completion(.failure(DatabaseError.requestFailed))
          return
        }
        
        completion(.success(movie))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  func addMovie(from movie: MovieEntity) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      if let realm = self.realm {
        do {
          try realm.write {
            realm.add(movie)
            
            completion(.success(true))
          }
        } catch {
          completion(.failure(DatabaseError.requestFailed))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  func updateMovieFavorite(by movieId: Int) -> AnyPublisher<MovieEntity, Error> {
    return Future<MovieEntity, Error> { completion in
      if let realm = self.realm, let movieEntity = {
        realm.objects(MovieEntity.self).filter("id = \(movieId)")
      }().first {
        do {
          try realm.write {
            movieEntity.setValue(!movieEntity.favorite, forKey: "favorite")
          }
          completion(.success(movieEntity))
        } catch {
          completion(.failure(DatabaseError.requestFailed))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }

}
