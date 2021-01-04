//
//  MovieEntry.swift
//  RiMovieWidgetExtension
//
//  Created by Ari Supriatna on 23/12/20.
//

import WidgetKit

struct MovieEntry: TimelineEntry {
  
  public let date: Date
  public let movies: [MovieUIModel]
  public var isPlaceholder: Bool = false
  
}

extension MovieEntry {
  
  static var stub: MovieEntry {
    .init(date: Date(), movies: [.stub, .stub])
  }
  
  static var placeholder: MovieEntry {
    .init(date: Date(), movies: [.stub, .stub], isPlaceholder: true)
  }
  
}
