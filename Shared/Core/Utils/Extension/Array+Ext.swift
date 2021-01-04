//
//  Array+Ext.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import RealmSwift

extension Array {
  func toList<T>(ofType: T.Type) -> List<T> {
    let list = List<T>()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        list.append(result)
      }
    }
    
    return list
  }
}
