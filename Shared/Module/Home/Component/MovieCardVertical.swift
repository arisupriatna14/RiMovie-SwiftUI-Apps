//
//  MovieCardVertical.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI
import SDWebImageSwiftUI
import MovieModule

struct MovieCardVertical: View {
  
  var movie: MovieUIModel
  @State private var opacity: Double = 0.25
  
  var body: some View {
    WebImage(url: movie.posterPathURL)
      .resizable()
      .renderingMode(.original)
      .placeholder(content: {
        ShimmerView(opacity: $opacity)
          .frame(width: 225, height: 340)
      })
      .scaledToFit()
      .frame(width: 200)
      .cornerRadius(10)
  }
}

struct MovieCardVertical_Previews: PreviewProvider {
  static var previews: some View {
    MovieCardVertical(movie: .stub)
  }
}
