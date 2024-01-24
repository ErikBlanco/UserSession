//
//  SignInValidationUnitTests.swift
//  UnitTests
//
//  Created by Erik Blanco on 1/23/24.
//

import XCTest
@testable import UserSession

final class SignInValidationUnitTests: XCTestCase {
    func test_SignInValidation_With_EmptyEmail_Returns_ValidationFailure() {
        let validation = SignInValidation()
        let request = SignInRequest(email: "", password: "123123")
        
        let result = validation.Validate(signInRequest: request)
        
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.error)
        XCTAssertEqual(result.error, ErrorConstants.email_cannot_be_empty)
    }
    
    func test_SignInValidation_With_InvalidEmail_Returns_ValidationFailure() {
        let validation = SignInValidation()
        let request = SignInRequest(email: "Erik", password: "123123")
        
        let result = validation.Validate(signInRequest: request)
        
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.error)
        XCTAssertEqual(result.error, ErrorConstants.invalid_email)
    }
    
    func test_SignInValidation_With_EmptyPassword_Returns_ValidationFailure() {
        let validation = SignInValidation()
        let request = SignInRequest(email: "eblanco@intekglobal.com", password: "")
        
        let result = validation.Validate(signInRequest: request)
        
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.error)
        XCTAssertEqual(result.error, ErrorConstants.password_cannot_be_empty)
    }
}
