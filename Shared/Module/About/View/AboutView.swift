//
//  AboutView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI

struct AboutView: View {
  
  @ObservedObject var presenter: AboutPresenter
  @State private var selectedCertificate: CertificateUIModel?
  
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
        Group {
          if let certificates = presenter.certificates {
            Text("My Certificates")
              .font(.title3)
              .fontWeight(.bold)
              .padding()
            
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
        
        Group {
          if let classDicoding = presenter.classes {
            Text("My Class")
              .font(.title3)
              .fontWeight(.bold)
              .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(classDicoding) { item in
                  Link(destination: URL(string: item.url)!) {
                    ClassItemView(classDicoding: item)
                      .padding(.trailing, 8)
                  }
                  .buttonStyle(PlainButtonStyle())
                }
              }
              .padding(.horizontal)
            }
          }
        }
        
      }
      .padding(.bottom, 24)
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
