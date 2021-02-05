//
//  UserRepository.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 29/12/20.
//

import Foundation

class UserRepository: UserRepositoryProtocol {
  
  func getCertificates() -> [CertificateModel] {
    return CertificateModel.stubs
  }
  
  func getMyClass() -> [ClassDicodingModel] {
    return ClassDicodingModel.stubs
  }
  
}
