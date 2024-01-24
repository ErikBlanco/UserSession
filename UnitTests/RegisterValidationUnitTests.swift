//
//  UnitTests.swift
//  UnitTests
//
//  Created by Erik Blanco on 1/23/24.
//

import XCTest
@testable import UserSession

class RegisterValidationUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_RegisterValidation_With_EmptyEmail_Returns_ValidationFailure() {
        let validation = RegisterValidation()
        let request = RegisterRequest(email: "", password: "123123", confirmPassword: "123123")
        
        let result = validation.Validate(registerRequest: request)
        
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.error)
        XCTAssertEqual(result.error, ErrorConstants.email_cannot_be_empty)
    }
    
    func test_RegisterValidation_With_InvalidEmail_Returns_ValidationFailure() {
        let validation = RegisterValidation()
        let request = RegisterRequest(email: "erik", password: "123123", confirmPassword: "123123")
        
        let result = validation.Validate(registerRequest: request)
        
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.error)
        XCTAssertEqual(result.error, ErrorConstants.invalid_email)
    }
    
    func test_RegisterValidation_With_EmptyPassword_Returns_ValidationFailure() {
        let validation = RegisterValidation()
        let request = RegisterRequest(email: "eblanco@intekglobal.com", password: "", confirmPassword: "123123")
        
        let result = validation.Validate(registerRequest: request)
        
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.error)
        XCTAssertEqual(result.error, ErrorConstants.password_cannot_be_empty)
    }
    
    func test_RegisterValidation_With_EmptyConfirmationPassword_Returns_ValidationFailure() {
        let validation = RegisterValidation()
        let request = RegisterRequest(email: "eblanco@intekglobal.com", password: "123123", confirmPassword: "")
        
        let result = validation.Validate(registerRequest: request)
        
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.error)
        XCTAssertEqual(result.error, ErrorConstants.confirmation_password_cannot_be_empty)
    }
    
    func test_RegisterValidation_With_PasswordsMismatch_Returns_ValidationFailure() {
        let validation = RegisterValidation()
        let request = RegisterRequest(email: "eblanco@intekglobal.com", password: "222222", confirmPassword: "444444")
        
        let result = validation.Validate(registerRequest: request)
        
        XCTAssertFalse(result.success)
        XCTAssertNotNil(result.error)
        XCTAssertEqual(result.error, ErrorConstants.passwords_do_not_match)
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
