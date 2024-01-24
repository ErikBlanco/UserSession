//
//  SignInMockService.swift
//  UserSession
//
//  Created by Erik Blanco on 1/23/24.
//

import Foundation

class MockSignInService: SignInService {
    var mockResult: Result<SignInResponse?, APIError> = .success(nil)
    
    func signIn(signInRequest: SignInRequest, completion: @escaping (Result<SignInResponse?, APIError>) -> Void) {
        completion(mockResult)
    }
}

class MockSignInViewModelDelegate: SignInViewModelDelegate {
    var apiResponseStatusCalled = false
    var isSuccessful: Bool?
    var response: SignInResponse?
    var error: APIError?
    
    func apiResponseStatus(isSuccessful: Bool, response: SignInResponse?, error: APIError?) {
        apiResponseStatusCalled = true
        self.isSuccessful = isSuccessful
        self.response = response
        self.error = error
    }
    
    func validationResult(result: ValidationResult) {
        
    }
}
