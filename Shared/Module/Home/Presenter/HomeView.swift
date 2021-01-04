//
//  HomeView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
  
  @ObservedObject var presenter: HomePresenter
  
  var body: some View {
    ZStack {
      if let upcoming = presenter.movieUpcoming,
         let popular = presenter.moviePopular,
         let topRated = presenter.movieTopRated,
         let nowPlaying = presenter.movieNowPlaying {
        
        ScrollView(.vertical) {
          VStack(alignment: .leading) {
            Text("Now Playing")
              .font(.title2)
              .fontWeight(.bold)
              .padding()

            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(nowPlaying) { item in
                  self.presenter.linkBuilderMovieDetail(for: item) {
                    MovieCardHorizontal(movie: item)
                      .frame(width: 280)
                      .padding(.trailing, 8)
                  }
                }
              }
              .padding(.horizontal)
            }
            
            Text("Popular Movies")
              .font(.title2)
              .fontWeight(.bold)
              .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(popular) { item in
                  self.presenter.linkBuilderMovieDetail(for: item) {
                    MovieCardVertical(movie: item)
                      .padding(.trailing, 8)
                  }
                }
              }
              .padding(.horizontal)
            }
            
            Text("Upcoming Movies")
              .font(.title2)
              .fontWeight(.bold)
              .padding()
            
            #if !APPCLIP
            BannerView(movies: upcoming)
              .frame(maxWidth: .infinity, maxHeight: .infinity)
            #else
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(upcoming) { item in
                  self.presenter.linkBuilderMovieDetail(for: item) {
                    MovieCardHorizontal(movie: item)
                      .frame(width: 280)
                      .padding(.trailing, 8)
                  }
                }
              }
              .padding(.horizontal)
            }
            #endif
            
            Text("Top Rated Movies")
              .font(.title2)
              .fontWeight(.bold)
              .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(topRated) { item in
                  self.presenter.linkBuilderMovieDetail(for: item) {
                    MovieCardHorizontal(movie: item, isShowOverview: true)
                      .frame(width: 280)
                      .padding(.trailing, 8)
                  }
                }
              }
              .padding(.horizontal)
            }
            .padding(.bottom, 24)
          }
        }
      } else {
        ProgressView()
      }
    }
    .navigationTitle("RiMovies+")
    .onAppear {
      self.presenter.getMovies(with: .nowPlaying)
      self.presenter.getMovies(with: .popular)
      self.presenter.getMovies(with: .topRated)
      self.presenter.getMovies(with: .upcoming)
    }
  }
}
