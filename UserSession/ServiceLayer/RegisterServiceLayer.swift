//
//  RegisterServiceLayer.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

protocol RegisterService {
    func register(registerRequest: RegisterRequest, completion: @escaping(Result<RegistrationResponse?, APIError>) -> Void)
}

class RegisterServiceImplementation: RegisterService {
    private let httpUtility: HttpUtility?
    init(_httpUtility: HttpUtility) {
        httpUtility = _httpUtility
    }
    
    func register(registerRequest: RegisterRequest, completion: @escaping (Result<RegistrationResponse?, APIError>) -> Void) {
        httpUtility?.registerUser(request: registerRequest) { message, error in
            if let error {
                completion(.failure(error))
            } else {
                completion(.success(RegistrationResponse(response: message)))
            }
        }
    }
}
