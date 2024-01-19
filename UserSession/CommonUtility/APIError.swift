//
//  APIError.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

//enum APIError: Error, CustomStringConvertible {
//    case requestFailed
//    
//    var description: String {
//        switch self {
//            case .requestFailed: return "API Request Failed"
//        }
//    }
//}

struct APIError: Error {
    var error: String
}
