//
//  SignInValidation.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

struct SignInValidation {
    func Validate(signInRequest: SignInRequest) -> Bool {
        guard let email = signInRequest.email, !email.isEmpty, isValidEmail(email: email) else { return false }
        guard let password = signInRequest.password, !password.isEmpty else { return false }
        
        return true
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegEx = RegexConstants.validEmail
        let emailPred = NSPredicate(format:RegexConstants.predicateSelfMatches, emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
}
