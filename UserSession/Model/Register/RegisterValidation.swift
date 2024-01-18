//
//  RegisterValidation.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

struct RegisterValidation {
    func Validate(registerRequest: RegisterRequest) -> Bool {
        guard let email = registerRequest.email, !email.isEmpty, isValidEmail(email: email) else { return false }
        guard let password = registerRequest.password, !password.isEmpty else { return false }
        guard let confirmPassword = registerRequest.confirmPassword, !confirmPassword.isEmpty else { return false }
        guard password == confirmPassword else { return false }
        
        return true
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegEx = RegexConstants.validEmail
        let emailPred = NSPredicate(format:RegexConstants.predicateSelfMatches, emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
}
