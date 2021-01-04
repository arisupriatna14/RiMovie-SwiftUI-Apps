//
//  CustomError+Ext.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 15/12/20.
//

import Foundation

enum MovieError: Error {
  
  case apiError
  case invalidEndpoint
  case invalidResponse
  case noData
  case serializationError
  
  var localizedDescription: String {
    switch self {
    case .apiError: return "Failed to fetch data"
    case .invalidEndpoint: return "Invalid endpoint"
    case .invalidResponse: return "Invalid response"
    case .noData: return "No data"
    case .serializationError: return "Failed to decode data"
    }
  }
  
}

enum DatabaseError: LocalizedError {

  case invalidInstance
  case requestFailed
  
  var errorDescription: String? {
    switch self {
    case .invalidInstance: return "Database can't instance."
    case .requestFailed: return "Your request failed."
    }
  }

}
