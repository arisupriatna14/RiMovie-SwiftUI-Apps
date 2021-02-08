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
    VStack(alignment: .leading, spacing: 16) {
      Image(classDicoding.image)
        .resizable()
        .scaledToFit()
        .cornerRadius(10)
      
      Text(classDicoding.name)
        .lineLimit(2)
        .font(.system(size: 14, weight: .semibold))
    }
    .padding(.all)
    .background(Color.white)
    .cornerRadius(16)
    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0.0, y: 20)
  }
}

struct ClassItemView_Previews: PreviewProvider {
  static var previews: some View {
    ClassItemView(classDicoding: .stub)
  }
}
