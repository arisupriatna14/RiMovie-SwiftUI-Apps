//
//  ClassDicodingMapper.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 03/01/21.
//

final class ClassDicodingMapper {
  
  static func mapClassDicodingDomainsToPresentations(input classes: [ClassDicodingModel]) -> [ClassDicodingUIModel] {
    return classes.map {
      return ClassDicodingUIModel(name: $0.name, url: $0.url, image: $0.image)
    }
  }
  
}
