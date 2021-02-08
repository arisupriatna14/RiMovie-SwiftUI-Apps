//
//  DetailView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 16/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
  
  @ObservedObject var presenter: DetailPresenter
  @State private var opacity: Double = 0.25
  @State private var selectedVideo: MovieVideoUIModel?
  
  var movie: MovieUIModel
  
  var body: some View {
    ZStack {
      if let detailMovie = presenter.detailMovie,
         let similarMovie = presenter.similarMovie {
        
        ScrollView(.vertical) {
          VStack(alignment: .leading) {
            WebImage(url: detailMovie.backdropPathURL)
              .resizable()
              .scaledToFit()
              .cornerRadius(10)
              .padding()
            
            Text("Overview")
              .font(.title2)
              .fontWeight(.bold)
              .padding(.horizontal)
            
            Text(detailMovie.overview)
              .padding()
            
            Group {
              if similarMovie.count > 0 {
                ListMovieSimilarView(similarMovie: similarMovie, presenter: presenter)
              }
              
              if detailMovie.cast.count > 0 {
                ListMovieCastView(movieCast: detailMovie.cast)
              }
              
              if detailMovie.crew.count > 0 {
                ListMovieCrewView(movieCrew: detailMovie.crew)
              }
              
              if detailMovie.videos.count > 0 {
                ListMovieTrailersView(videoTrailers: detailMovie.videos, selectedVideo: $selectedVideo)
              }
            }
            
          }
        }
      } else {
        ProgressView()
      }
    }
    .navigationTitle(movie.title)
    .sheet(item: self.$selectedVideo) { trailer in
      SafariView(url: trailer.youtubeURL!)
    }
    .toolbar {
      #if !APPCLIP
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: addToFavorite) {
          Image(systemName: presenter.movieFavorite?.favorite ?? false ? "star.fill" : "star")
        }
      }
      #endif
    }
    .onAppear {
      if self.presenter.detailMovie == nil && self.presenter.movieFavorite == nil {
        self.presenter.getMovie(movieId: movie.id)
        self.presenter.getMovieSimilar(movieId: movie.id)
        self.presenter.getMovieFavorite(movieId: movie.id)
      }
    }
  }
}

extension DetailView {
  func addToFavorite() {
    if presenter.movieFavorite != nil {
      self.presenter.updateMovieFavorite(movieId: movie.id)
    } else {
      self.presenter.addMovieToFavorite(movie: movie)
    }
  }
}
