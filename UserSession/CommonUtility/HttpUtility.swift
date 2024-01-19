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

struct HttpUtility {
    func registerUser(request: RegisterRequest, completionHandler: @escaping (_ result: RegisterResponse?, _ apiError: APIError?)-> Void) {
        Auth.auth().createUser(withEmail: request.email!, password: request.password!) { authResult, error in
            if let error {
                _ = completionHandler(nil, APIError(error: error.localizedDescription))
            } else {
                _ = completionHandler(RegisterResponse(message: "Successully created user"), nil)
            }
        }
    }
    
    func signInUser(request: SignInRequest, completionHandler: @escaping (_ result: SignInResponse?, _ apiError: APIError?)-> Void) {
        Auth.auth().signIn(withEmail: request.email!, password: request.password!) { authResult, error in
            if let error {
                _ = completionHandler(nil, APIError(error: error.localizedDescription))
            } else {
                _ = completionHandler(SignInResponse(message: "Successully created user"), nil)
            }
        }
    }
}
