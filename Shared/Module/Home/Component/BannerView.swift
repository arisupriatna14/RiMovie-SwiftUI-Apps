//
//  BannerView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct BannerView: View {
  
  var movies: [MovieUIModel]
  
  var body: some View {
    TabView {
      ForEach(movies.suffix(5)) { item in
        WebImage(url: item.posterPathURL)
          .resizable()
          .aspectRatio(contentMode: .fill)
      }
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
  }
}
