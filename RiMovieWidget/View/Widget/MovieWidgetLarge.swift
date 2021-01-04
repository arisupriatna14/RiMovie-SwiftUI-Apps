//
//  MovieWidgetLarge.swift
//  RiMovieWidgetExtension
//
//  Created by Ari Supriatna on 23/12/20.
//

import SwiftUI
import WidgetKit

struct MovieWidgetLarge: View {
  
  var entry: MovieEntry
  
  var body: some View {
    VStack(alignment: .leading) {
      ZStack(alignment: .bottom) {
        NetworkImage(url: entry.movies.first?.backdropPathURL)
          .scaledToFill()
          .padding(.bottom, 8)

        Text(entry.movies.first?.title ?? "Unknown")
          .foregroundColor(.white)
          .fontWeight(.semibold)
          .offset(x: -70, y: -16)
      }
      
      VStack {
        ForEach(entry.movies.suffix(2)) { item in
          VStack(alignment: .leading) {
            HStack {
              NetworkImage(url: item.backdropPathURL)
                .scaledToFit()
                .frame(width: 100)
                .cornerRadius(5)
              
              VStack(alignment: .leading, spacing: 8) {
                Text(item.originalTitle)
                  .font(.system(size: 14))
                  .fontWeight(.semibold)
                
                Text("Upcoming")
                  .font(.caption2)
                  .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                
                Divider()
              }
              .padding(.leading, 8)
              
            }
          }
          .padding(.vertical, 8)
        }
      }
      .padding([.horizontal, .bottom], 16)
    }
    .redacted(reason: entry.isPlaceholder ? .placeholder : .init())
  }
}

struct MovieWidgetLarge_Previews: PreviewProvider {
  static var previews: some View {
    MovieWidgetLarge(entry: .stub)
      .previewContext(WidgetPreviewContext(family: .systemLarge))
  }
}
