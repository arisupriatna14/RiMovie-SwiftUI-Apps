//
//  ListVideoTrialView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 16/12/20.
//

import SwiftUI
import AVKit

struct ListVideoTrialView: View {
  
  var movie: MovieModel
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Trailers")
        .font(.title2)
        .fontWeight(.bold)
        .padding()

      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(movie.videos) { item in
            VideoPlayer(player: AVPlayer(url: item.youtubeURL!))
              .frame(width: 300, height: 200)
              .cornerRadius(10)
          }
        }
        .padding(.horizontal)
      }
    }
  }
}

struct ListVideoTrialView_Previews: PreviewProvider {
  static var previews: some View {
    ListVideoTrialView(movie: .stub)
  }
}
 
