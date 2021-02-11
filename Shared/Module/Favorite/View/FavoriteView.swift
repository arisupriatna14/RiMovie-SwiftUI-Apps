//
//  FavoriteView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI
import MovieModule

struct FavoriteView: View {
  
  @ObservedObject var presenter: MoviesFavoritePresenter
  
  var body: some View {
    ZStack {
      if let movies = presenter.list {
        if movies.isEmpty {
          CustomEmptyView(image: "no_favorite", title: "Favorite is empty")
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            VStack {
              ForEach(movies) { item in
                linkBuilderMovieDetail(for: item) {
                  MovieCardHorizontal(movie: item, isShowOverview: true)
                    .padding(.bottom)
                }
              }
            }
            .padding(.all)
          }
        }
      } else {
        ProgressView()
      }
    }
    .navigationTitle("Favorite")
    .onAppear {
      self.presenter.getList(request: nil)
    }
  }
}

extension FavoriteView {
  func linkBuilderMovieDetail<Content: View>(
    for movie: MovieUIModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: FavoriteRouter().makeMovieDetailView(for: movie)) {
      content()
    }
  }
}
