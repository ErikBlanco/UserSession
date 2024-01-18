//
//  RegisterServiceLayer.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

protocol RegisterService {
    func register(registerRequest: RegisterRequest)
}

class RegisterServiceImplementation: RegisterService {
    private let httpUtility: HttpUtility?
    
    init(_httpUtility: HttpUtility) {
        httpUtility = _httpUtility
    }
    
    func register(registerRequest: RegisterRequest) {
        // TO DO: Register logic - Use our private httpUtility constant
        
    }
}
