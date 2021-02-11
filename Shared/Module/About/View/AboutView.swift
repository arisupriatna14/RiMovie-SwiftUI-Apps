//
//  AboutView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI
import AboutModule

struct AboutView: View {
  
  @ObservedObject var presenter: AboutPresenter
  @State private var selectedCertificate: CertificateUIModel?
  let columns: [GridItem] = [GridItem(.adaptive(minimum: 160), spacing: 16)]
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      
      Image("ari")
        .resizable()
        .scaledToFit()
        .frame(width: 180)
        .clipShape(Circle())
        .padding(.top, 24)
      
      Text("Ari Supriatna")
        .font(.title2)
        .fontWeight(.bold)
      
      VStack(alignment: .leading) {
        Text("My Certificates")
          .font(.title3)
          .fontWeight(.bold)
          .padding()
        
        if let certificates = presenter.certificates {
          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEach(certificates) { item in
                CertificateItemView(certificate: item)
                  .frame(width: 280)
                  .padding(.trailing, 8)
                  .onTapGesture {
                    self.selectedCertificate = item
                  }
              }
            }
            .padding(.horizontal)
          }
        }
      }
      .padding(.bottom, 24)
      
      VStack(alignment: .leading) {
        Text("My Class")
          .font(.title3)
          .fontWeight(.bold)
          .padding(.horizontal)

        if let classDicoding = presenter.classes {
          LazyVStack {
            LazyVGrid(columns: columns, spacing: 16) {
              ForEach(classDicoding) { item in
                Link(destination: URL(string: item.url)!) {
                  ClassItemView(classDicoding: item)
                }
                .buttonStyle(PlainButtonStyle())
              }
            }
          }
          .padding(.all)
        }
      }
    }
    .navigationTitle("About")
    .sheet(item: self.$selectedCertificate) { certificate in
      SafariView(url: URL(string: certificate.url)!)
    }
    .onAppear {
      self.presenter.getCertificates()
      self.presenter.getClasses()
    }
  }
}
