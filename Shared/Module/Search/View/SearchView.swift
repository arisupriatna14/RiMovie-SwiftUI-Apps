//
//  SearchView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI

struct SearchView: View {
  
  @ObservedObject var presenter: SearchPresenter
  
  var body: some View {
    SearchBar(text: self.$presenter.query) {
      VStack {
        Group {
          if presenter.isLoadingState {
            ProgressView()
          } else if presenter.isEmptyResult {
            VStack(alignment: .center) {
              Spacer()
              Text("Movie yang kamu cari tidak ditemukan 🥺")
            }
          } else if presenter.query.isEmpty {
            CustomEmptyView(
              image: "search_tab",
              title: "Search your favorite movies"
            ).offset(y: -50)
          }
        }
        
        if let movies = presenter.movies {
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
      }
      .navigationTitle("Search Movies")
    }
    .edgesIgnoringSafeArea(.all)
    .onAppear {
      self.presenter.startObserve()
    }
  }
}
