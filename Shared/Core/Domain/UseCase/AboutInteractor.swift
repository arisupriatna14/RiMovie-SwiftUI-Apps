//
//  AboutInteractor.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import Foundation
import Combine

protocol AboutUseCase {
  
  func getCertificates() -> [CertificateUIModel]
  func getClasses() -> [ClassDicodingUIModel]
  
}

class AboutInteractor: AboutUseCase {
  
  private let repository: UserRepositoryProtocol
  
  required init(repository: UserRepositoryProtocol) {
    self.repository = repository
  }
  
  func getCertificates() -> [CertificateUIModel] {
    return CertificateMapper.mapCertificatesDomainsToPresentations(input: repository.getCertificates())
  }
  
  func getClasses() -> [ClassDicodingUIModel] {
    return ClassDicodingMapper.mapClassDicodingDomainsToPresentations(input: repository.getMyClass())
  }
  
}
