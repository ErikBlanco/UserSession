//
//  RegisterMockService.swift
//  UserSession
//
//  Created by Erik Blanco on 1/23/24.
//

import Foundation

class MockRegisterService: RegisterService {
    var mockResult: Result<RegisterResponse?, APIError> = .success(nil)
    
    func register(registerRequest: RegisterRequest, completion: @escaping (Result<RegisterResponse?, APIError>) -> Void) {
        completion(mockResult)
    }
}

class MockRegisterViewModelDelegate: RegisterViewModelDelegate {
    var apiResponseStatusCalled = false
    var isSuccessful: Bool?
    var response: RegisterResponse?
    var error: APIError?
    
    func apiResponseStatus(isSuccessful: Bool, response: RegisterResponse?, error: APIError?) {
        apiResponseStatusCalled = true
        self.isSuccessful = isSuccessful
        self.response = response
        self.error = error
    }
    
    func validationResult(result: ValidationResult) {
        
    }
}
