//
//  RegisterServiceLayer.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

protocol RegisterService {
    func register()
}

class RegisterServiceImplementation: RegisterService {
    private let httpUtility: HttpUtility?
    
    init(_httpUtility: HttpUtility) {
        httpUtility = _httpUtility
    }
    
    func register() {
        // TO DO: Register logic - Use our private httpUtility constant
    }
}
