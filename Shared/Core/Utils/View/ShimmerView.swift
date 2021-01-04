//
//  ShimmerView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 16/12/20.
//

import SwiftUI

struct ShimmerView: View {
  @Binding var opacity: Double
  
  var body: some View {
    Rectangle()
      .fill(Color.gray.opacity(0.25))
      .cornerRadius(20)
      .opacity(opacity)
      .onAppear {
        let baseAnimation = Animation.easeInOut(duration: 0.9)
        let repeated = baseAnimation.repeatForever(autoreverses: true)
        withAnimation(repeated) {
          self.opacity = 1.0
        }
      }
  }
}
