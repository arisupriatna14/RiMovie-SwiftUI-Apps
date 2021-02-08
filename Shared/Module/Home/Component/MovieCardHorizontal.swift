//
//  MovieCardHorizontal.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCardHorizontal: View {
  
  var movie: MovieUIModel
  @State private var opacity: Double = 0.25
  @State var isShowOverview = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      WebImage(url: movie.backdropPathURL)
        .resizable()
        .renderingMode(.original)
        .placeholder(content: {
          ShimmerView(opacity: $opacity)
            .frame(width: 300, height: 188)
        })
        .scaledToFit()
        .cornerRadius(10)
      
      Text(movie.title)
        .font(.system(size: 16, weight: .medium))
        .lineLimit(1)
        .foregroundColor(Color("black"))
      
      Group {
        if isShowOverview {
          Text(movie.overview)
            .foregroundColor(.secondary)
            .font(.caption)
            .lineLimit(2)
        }
      }
    }
  }
}

struct MovieCardHorizontal_Previews: PreviewProvider {
  static var previews: some View {
    MovieCardHorizontal(movie: .stub, isShowOverview: false)
      .padding()
  }
}
