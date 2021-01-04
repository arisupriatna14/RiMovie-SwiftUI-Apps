//
//  MovieWidgetMedium.swift
//  RiMovieWidgetExtension
//
//  Created by Ari Supriatna on 24/12/20.
//

import SwiftUI
import WidgetKit

struct MovieWidgetMedium: View {
  
  var entry: MovieEntry
  
  var body: some View {
    VStack(alignment: .leading) {
      
      Text("Upcoming Movies")
        .font(.system(size: 16, weight: .semibold, design: .rounded))
      
      HStack(spacing: 16) {
        ForEach(entry.movies.suffix(2)) { item in
          VStack(alignment: .leading) {
            NetworkImage(url: item.backdropPathURL)
              .scaledToFit()
              .frame(width: 150)
              .cornerRadius(5)
            
            Text(item.originalTitle)
              .font(.system(size: 12))
              .fontWeight(.semibold)
              .frame(width: 150)
              .lineLimit(1)
          }
        }
      }
    }
    .redacted(reason: entry.isPlaceholder ? .placeholder : .init())
  }
}

struct MovieWidgetMedium_Previews: PreviewProvider {
  static var previews: some View {
    MovieWidgetMedium(entry: .stub)
      .previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
