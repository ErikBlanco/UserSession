//
//  SignInServiceLayer.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

protocol SignInService {
    func signIn(signInRequest: SignInRequest, completion: @escaping(Result<SignInResponse?, APIError>) -> Void)
}

class SignInServiceImplementation: SignInService {
    private let httpUtility: HttpUtility?
    
    init(_httpUtility: HttpUtility) {
        httpUtility = _httpUtility
    }
    
    func signIn(signInRequest: SignInRequest, completion: @escaping (Result<SignInResponse?, APIError>) -> Void) {
        httpUtility?.signInUser(request: signInRequest) { result, error in
            if let error {
                completion(.failure(error))
            } else {
                completion(.success(result))
            }
        }
    }
}
