//
//  SignInServiceLayer.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

protocol SignInService {
    func signIn()
}

class SignInServiceImplementation: SignInService {
    private let httpUtility: HttpUtility?
    
    init(_httpUtility: HttpUtility) {
        httpUtility = _httpUtility
    }
    
    func signIn() {
        // TO DO: Sign in logic - Use our private httpUtility constant
    }
}
