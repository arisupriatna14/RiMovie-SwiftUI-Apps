//
//  ListMovieTrailersView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 21/12/20.
//

import SwiftUI

struct ListMovieTrailersView: View {
  
  var videoTrailers: [MovieVideoUIModel]
  @Binding var selectedVideo: MovieVideoUIModel?
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Trailers")
        .font(.title2)
        .fontWeight(.bold)
        .padding(.bottom)
      
      ForEach(videoTrailers) { item in
        Button(action: { self.selectedVideo = item }) {
          VStack {
            HStack {
              Text(item.name)
              Spacer()
              Image(systemName: "play.circle.fill")
                .foregroundColor(Color(UIColor.systemBlue))
            }
            
            Divider()
          }
        }
      }
    }
    .padding()
  }
}

struct ListMovieTrailersView_Previews: PreviewProvider {
  static var previews: some View {
    ListMovieTrailersView(videoTrailers: [.stub], selectedVideo: .constant(nil))
  }
}
