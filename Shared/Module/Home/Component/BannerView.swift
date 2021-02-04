//
//  BannerView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct BannerView: View {
  
  @ObservedObject var presenter: HomePresenter
  var movies: [MovieUIModel]
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(movies.suffix(10)) { item in
          self.presenter.linkBuilderMovieDetail(for: item) {
            WebImage(url: item.posterPathURL)
              .placeholder(content: {
                VStack {
                  ProgressView()
                }
                .frame(maxWidth: UIScreen.main.bounds.width - 32, maxHeight: UIScreen.main.bounds.height / 1.5)
                .background(Color.secondary)
              })
              .resizable()
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
