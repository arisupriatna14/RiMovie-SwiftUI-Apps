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
              MovieCardView(movie: item)
                .padding(.trailing, 4)
            }
            .buttonStyle(PlainButtonStyle())
          }
        }
        .padding(.all)
        .padding(.bottom)
      }
    }
  }
}
