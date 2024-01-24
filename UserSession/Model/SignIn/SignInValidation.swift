//
//  SignInValidation.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

struct SignInValidation {
    func Validate(signInRequest: SignInRequest) -> ValidationResult {
        guard let email = signInRequest.email, !email.isEmpty else { return ValidationResult(success: false, error: ErrorConstants.email_cannot_be_empty) }
        guard isValidEmail(email: email) else { return ValidationResult(success: false, error: ErrorConstants.invalid_email)}
        guard let password = signInRequest.password, !password.isEmpty else { return ValidationResult(success: false, error: ErrorConstants.password_cannot_be_empty) }
        
        return ValidationResult(success: true)
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegEx = RegexConstants.validEmail
        let emailPred = NSPredicate(format:RegexConstants.predicateSelfMatches, emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
}
