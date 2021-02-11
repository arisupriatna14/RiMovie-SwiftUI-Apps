//
//  HomeView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 04/01/21.
//

import SwiftUI
import SDWebImageSwiftUI
import MovieModule
import Resolver

struct HomeView: View {

  @ObservedObject var presenter: MoviesPresenter<MoviesInteractor>
  
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
                  linkBuilderMovieDetail(for: item) {
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
                  linkBuilderMovieDetail(for: item) {
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
            
            BannerView(movies: upcoming)
              .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text("Top Rated Movies")
              .font(.title2)
              .fontWeight(.bold)
              .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(topRated) { item in
                  linkBuilderMovieDetail(for: item) {
                    MovieCardView(movie: item)
                      .padding(.trailing, 4)
                  }
                  .buttonStyle(PlainButtonStyle())
                }
              }
              .padding(.horizontal)
              .padding(.bottom, 36)
            }
          }
        }
      } else {
        ProgressView()
      }
    }
    .navigationTitle("RiMovies+")
    .onAppear {
      self.presenter.getMovies(request: .nowPlaying)
      self.presenter.getMovies(request: .popular)
      self.presenter.getMovies(request: .topRated)
      self.presenter.getMovies(request: .upcoming)
    }
  }
}
