//
//  ClassItemView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI

struct ClassItemView: View {
  
  var classDicoding: ClassDicodingUIModel
  
  var body: some View {
    VStack(alignment: .leading) {
      Image(classDicoding.image)
        .resizable()
        .scaledToFit()
        .frame(width: 220)
        .cornerRadius(10)
      
      Text(classDicoding.name)
        .font(.subheadline)
        .fontWeight(.medium)
        .lineLimit(1)
        .frame(width: 220)
    }
  }
}

struct ClassItemView_Previews: PreviewProvider {
  static var previews: some View {
    ClassItemView(classDicoding: .stub)
  }
}
