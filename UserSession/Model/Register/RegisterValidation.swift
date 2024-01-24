//
//  RegisterValidation.swift
//  UserSession
//
//  Created by Erik Blanco on 1/18/24.
//

import Foundation

struct RegisterValidation {
    func Validate(registerRequest: RegisterRequest) -> ValidationResult {
        guard let email = registerRequest.email, !email.isEmpty else { return ValidationResult(success: false, error: ErrorConstants.email_cannot_be_empty) }
        guard isValidEmail(email: email) else { return ValidationResult(success:false, error: ErrorConstants.invalid_email)}
        guard let password = registerRequest.password, !password.isEmpty else { return ValidationResult(success: false, error: ErrorConstants.password_cannot_be_empty) }
        guard let confirmPassword = registerRequest.confirmPassword, !confirmPassword.isEmpty else { return ValidationResult(success: false, error: ErrorConstants.confirmation_password_cannot_be_empty) }
        guard password == confirmPassword else { return ValidationResult(success: false, error: ErrorConstants.passwords_do_not_match) }
        
        return ValidationResult(success: true)
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegEx = RegexConstants.validEmail
        let emailPred = NSPredicate(format:RegexConstants.predicateSelfMatches, emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
}
