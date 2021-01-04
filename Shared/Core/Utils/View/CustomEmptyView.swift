//
//  CustomEmptyView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 04/01/21.
//

import SwiftUI

struct CustomEmptyView: View {
  var image: String
  var title: String
  
  var body: some View {
    VStack {
      Image(image)
        .resizable()
        .renderingMode(.original)
        .scaledToFit()
        .frame(width: 250)
      
      Text(title)
        .font(.system(.body, design: .rounded))
    }
  }
}

struct CustomEmptyView_Previews: PreviewProvider {
  static var previews: some View {
    CustomEmptyView(image: "search_tab", title: "Search your favorite movies")
  }
}
