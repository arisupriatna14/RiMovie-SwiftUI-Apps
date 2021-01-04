//
//  UserRepositoryProtocol.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 05/01/21.
//

protocol UserRepositoryProtocol {
  
  func getCertificates() -> [CertificateModel]
  func getMyClass() -> [ClassDicodingModel]
  
}
