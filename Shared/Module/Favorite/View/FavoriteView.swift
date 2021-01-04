//
//  FavoriteView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI

struct FavoriteView: View {
  
  @ObservedObject var presenter: FavoritePresenter
  
  var body: some View {
    ZStack {
      if let movies = presenter.movies {
        if movies.isEmpty {
          CustomEmptyView(image: "no_favorite", title: "Favorite is empty")
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            VStack {
              ForEach(movies) { item in
                self.presenter.linkBuilderMovieDetail(for: item) {
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
      self.presenter.getMoviesFavorite()
    }
  }
}
