//
//  UserRepository.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 29/12/20.
//

import Foundation

final class UserRepository: NSObject {
  
  private override init() { }
  static let sharedInstance = UserRepository()
  
}

extension UserRepository: UserRepositoryProtocol {
  
  func getCertificates() -> [CertificateModel] {
    return CertificateModel.stubs
  }
  
  func getMyClass() -> [ClassDicodingModel] {
    return ClassDicodingModel.stubs
  }
  
}
