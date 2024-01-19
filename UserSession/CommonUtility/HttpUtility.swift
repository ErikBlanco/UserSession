//
//  HttpUtility.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import FirebaseAuth
import Foundation

enum HTTPMethod: String, CaseIterable {
    case POST = "POST"
    case GET = "GET"
}

protocol FirebaseResponse {
    
}

struct HttpUtility {
    func registerUser(request: RegisterRequest, completionHandler: @escaping (_ result: RegisterResponse?, _ apiError: APIError?)-> Void) {
        Auth.auth().createUser(withEmail: request.email!, password: request.password!) { authResult, error in
            if let error {
                _ = completionHandler(nil, APIError(error: error.localizedDescription))
            } else {
                if let authResult {
                    _ = completionHandler(RegisterResponse(message: "Successully created user"), nil)
                }
            }
        }
    }
}
