//
//  MovieCardView.swift
//  RiMovie
//
//  Created by Ari Supriatna on 07/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCardView: View {
  var movie: MovieUIModel
  var width: CGFloat = 200
  var padding: CGFloat = 8
  @State private var opacity: Double = 0.25
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      WebImage(url: movie.posterPathURL)
        .resizable()
        .renderingMode(.original)
        .placeholder(content: {
          ShimmerView(opacity: $opacity)
            .frame(width: 200, height: 250)
        })
        .scaledToFit()
        .frame(width: width)
        .cornerRadius(10)
      
      VStack(alignment: .leading, spacing: 8) {
        Text(movie.title)
          .lineLimit(1)
          .font(.system(size: 14, weight: .semibold))
        
        Text(movie.overview)
          .lineLimit(2)
          .font(.caption2)
          .multilineTextAlignment(.leading)
      }
      .padding(.all, padding)
    }
    .padding(.all, padding)
    .frame(width: width + 20)
    .background(Color.white)
    .cornerRadius(16)
    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0.0, y: 20)
  }
}

struct MovieCardView_Previews: PreviewProvider {
  static var previews: some View {
    MovieCardView(movie: .stub)
  }
}
