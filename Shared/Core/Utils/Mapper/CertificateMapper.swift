//
//  CertificateMapper.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 03/01/21.
//

final class CertificateMapper {
  
  static func mapCertificatesDomainsToPresentations(input certificates: [CertificateModel]) -> [CertificateUIModel] {
    return certificates.map {
      return CertificateUIModel(image: $0.image, name: $0.name, url: $0.url)
    }
  }
  
}
