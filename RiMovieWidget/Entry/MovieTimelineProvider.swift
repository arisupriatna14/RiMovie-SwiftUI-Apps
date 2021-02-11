//
//  MovieTimelineProvider.swift
//  RiMovieWidgetExtension
//
//  Created by Ari Supriatna on 23/12/20.
//

import WidgetKit
import Combine
import MovieModule

struct MovieProvider: TimelineProvider {
  
  typealias Entry = MovieEntry
  let dataFetcher = DataFetcher.sharedInstance
  
  func placeholder(in context: Context) -> MovieEntry {
    .placeholder
  }
  
  func getSnapshot(in context: Context, completion: @escaping (MovieEntry) -> Void) {
    if context.isPreview {
      completion(.placeholder)
    } else {
      dataFetcher.fetchMovies { (result) in
        let entry = MovieEntry(date: Date(), movies: result)
        completion(entry)
      }
    }
  }
  
  func getTimeline(in context: Context, completion: @escaping (Timeline<MovieEntry>) -> Void) {
    dataFetcher.fetchMovies { (result) in
      let entry = MovieEntry(date: Date(), movies: result)
      let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(60 * 10)))
      completion(timeline)
    }
  }
  
}

public class DataFetcher: ObservableObject {
  
  private var cancellables: Set<AnyCancellable> = []
  private let remote = GetMoviesRemoteDataSource()
  
  static let sharedInstance = DataFetcher()

  func fetchMovies(completion: @escaping ([MovieUIModel]) -> Void) {
    remote.execute(request: .nowPlaying)
      .map { MovieMapper().transformResponseToDomain(response: $0) }
      .map { MovieMapper().transformDomainToPresentation(domain: $0) }
      .eraseToAnyPublisher()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { error in
        switch error {
        case .failure:
          debugPrint("Error fetchMovie: \(error)")
        case .finished:
          debugPrint("Fetch Movie Finished!")
        }
      }, receiveValue: { result in
        completion(result)
      })
      .store(in: &cancellables)
  }
  
}
