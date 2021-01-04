//
//  ListMovieSimilarView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 21/12/20.
//

import SwiftUI

struct ListMovieSimilarView: View {
  
  var similarMovie: [MovieUIModel]
  @ObservedObject var presenter: DetailPresenter
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Related")
        .font(.title2)
        .fontWeight(.bold)
        .padding()
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(similarMovie) { item in
            self.presenter.linkBuilderMovieDetail(for: item) {
              MovieCardHorizontal(movie: item)
                .frame(width: 280)
                .padding(.trailing, 8)
            }
          }
        }
        .padding(.horizontal)
      }
      .padding(.bottom, 24)
    }
  }
}
