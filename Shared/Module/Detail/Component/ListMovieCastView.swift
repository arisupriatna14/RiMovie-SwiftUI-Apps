//
//  ListMovieCastView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 21/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListMovieCastView: View {
  
  var movieCast: [MovieCastUIModel]
  @State private var opacity: Double = 0.25
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Cast")
        .font(.title2)
        .fontWeight(.bold)
        .padding()
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(movieCast.filter { $0.profilePath != "" }) { item in
            VStack(alignment: .leading) {
              WebImage(url: item.profilePathURL)
                .resizable()
                .renderingMode(.original)
                .placeholder(content: {
                  ShimmerView(opacity: $opacity)
                    .frame(width: 100, height: 150)
                })
                .scaledToFit()
                .frame(width: 100, height: 150)
                .cornerRadius(10)
              
              Text(item.name)
                .font(.subheadline)
                .lineLimit(1)
                .frame(width: 100)
            }
            .padding(.trailing, 8)
          }
        }
        .padding(.horizontal)
      }
    }
  }
}

struct ListMovieCastView_Previews: PreviewProvider {
  static var previews: some View {
    ListMovieCastView(movieCast: [.stub])
  }
}
