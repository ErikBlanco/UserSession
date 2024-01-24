//
//  RegisterViewModelTests.swift
//  UnitTests
//
//  Created by Erik Blanco on 1/23/24.
//

import XCTest
@testable import UserSession

final class RegisterViewModelTests: XCTestCase {

    var viewModel: RegisterViewModel!
    var mockRegisterService: MockRegisterService!
    var mockDelegate: MockRegisterViewModelDelegate!
    
    override func setUp() {
        super.setUp()
        
        mockRegisterService = MockRegisterService()
        viewModel = RegisterViewModel(_registerService: mockRegisterService)
        mockDelegate = MockRegisterViewModelDelegate()
        viewModel.registerDelegate = mockDelegate
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockRegisterService = nil
        mockDelegate = nil
        super.tearDown()
    }

    func testRegisterUserWebService_Successful() throws {
        let registerRequest = RegisterRequest(email: "eblanco@intekglobal.com", password: "123123", confirmPassword: "123123")
        viewModel.registerRequest = registerRequest
        mockRegisterService.mockResult = .success(RegisterResponse(message: SuccessConstants.successfully_created_user))
        
        let expectation = self.expectation(description: "ValidRequest_Returns_SuccessfulResponse")
        
        viewModel.registerUserWebServiceHandler { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response?.message)
                XCTAssertEqual(response?.message, SuccessConstants.successfully_created_user)
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testRegisterUserWebService_Failure() {
        let registerRequest = RegisterRequest(email: "eblanco@intekglobal.com", password: "123123", confirmPassword: "123123")
        viewModel.registerRequest = registerRequest
        mockRegisterService.mockResult = .failure(APIError(message: ErrorConstants.error_registering_user))
        let expectation = self.expectation(description: "InvalidRequest_Returns_FailureResponse")
        
        viewModel.registerUserWebServiceHandler { result in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.message, ErrorConstants.error_registering_user)
            default:
                XCTAssertNil(result)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }


}
