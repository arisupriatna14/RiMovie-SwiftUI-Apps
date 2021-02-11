//
//  CertificateItemView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI
import AboutModule

struct CertificateItemView: View {
  var certificate: CertificateUIModel
  
  var body: some View {
    VStack(alignment: .leading) {
      Image(certificate.image)
        .resizable()
        .scaledToFit()
      
      Text(certificate.name)
        .font(.subheadline)
        .fontWeight(.medium)
        .lineLimit(1)
    }
  }
}

struct CertificateItemView_Previews: PreviewProvider {
  static var previews: some View {
    CertificateItemView(certificate: .stub)
  }
}
