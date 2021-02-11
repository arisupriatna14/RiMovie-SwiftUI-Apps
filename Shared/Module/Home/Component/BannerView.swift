//
//  BannerView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI
import SDWebImageSwiftUI
import MovieModule
import Resolver

struct BannerView: View {

  @State private var opacity: Double = 0.25
  var movies: [MovieUIModel]
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(movies.suffix(10)) { item in
          NavigationLink(destination: DetailView(presenter: Resolver.resolve(), movie: item)) {
            WebImage(url: item.posterPathURL)
              .resizable()
              .renderingMode(.original)
              .placeholder(content: {
                ShimmerView(opacity: $opacity)
                  .frame(maxWidth: UIScreen.main.bounds.width - 32, maxHeight: UIScreen.main.bounds.height / 1.5)
              })
              .scaledToFill()
              .frame(maxWidth: UIScreen.main.bounds.width - 32, maxHeight: UIScreen.main.bounds.height / 1.5)
              .cornerRadius(30)
              .padding(.trailing, 8)
          }
        }
      }
      .padding(.horizontal)
    }
  }
}
