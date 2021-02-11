//
//  DependencyManager.swift
//  RiMovie
//
//  Created by Ari Supriatna on 05/02/21.
//

import Foundation
import Resolver
import RealmSwift

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    registerAllMapperServices()
    registerAllRepositoryServices()
    registerCoreServices()
    registerHomeServices()
    registerDetailServices()
    #if !APPCLIP
    registerSearchServices()
    registerAboutServices()
    registerFavoriteServices()
    #endif
  }
}
