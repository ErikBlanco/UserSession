//
//  HttpUtility.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

// HttpUtility - Due to the lack of a service for this exercise, we'll be making use of FirebaseAuth directly.

import FirebaseAuth
import Foundation

struct HttpUtility {
    func registerUser(request: RegisterRequest, completionHandler: @escaping (_ result: RegisterResponse?, _ apiError: APIError?)-> Void) {
        Auth.auth().createUser(withEmail: request.email!, password: request.password!) { authResult, error in
            if let error {
                _ = completionHandler(nil, APIError(message: error.localizedDescription))
            } else {
                _ = completionHandler(RegisterResponse(message: SuccessConstants.successfully_created_user), nil)
            }
        }
    }
    
    func signInUser(request: SignInRequest, completionHandler: @escaping (_ result: SignInResponse?, _ apiError: APIError?)-> Void) {
        Auth.auth().signIn(withEmail: request.email!, password: request.password!) { authResult, error in
            if let error {
                _ = completionHandler(nil, APIError(message: error.localizedDescription))
            } else {
                _ = completionHandler(SignInResponse(message: SuccessConstants.successfully_created_user), nil)
            }
        }
    }
}
