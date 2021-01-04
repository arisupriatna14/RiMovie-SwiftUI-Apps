//
//  AboutPresenter.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI
import Combine

class AboutPresenter: ObservableObject {
  
  private let aboutUseCase: AboutUseCase
  
  @Published var certificates: [CertificateUIModel]?
  @Published var classes: [ClassDicodingUIModel]?
  
  init(aboutUseCase: AboutUseCase) {
    self.aboutUseCase = aboutUseCase
  }
  
  func getCertificates() {
    certificates = aboutUseCase.getCertificates()
  }
  
  func getClasses() {
    classes = aboutUseCase.getClasses()
  }
  
}
