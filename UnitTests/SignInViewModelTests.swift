//
//  SignInViewModelTests.swift
//  UnitTests
//
//  Created by Erik Blanco on 1/23/24.
//

import XCTest
@testable import UserSession

final class SignInViewModelTests: XCTestCase {

    var viewModel: SignInViewModel!
    var mockSignInService: MockSignInService!
    var mockDelegate: MockSignInViewModelDelegate!
    
    override func setUp() {
        super.setUp()
        
        mockSignInService = MockSignInService()
        viewModel = SignInViewModel(_signInService: mockSignInService)
        mockDelegate = MockSignInViewModelDelegate()
        viewModel.signInDelegate = mockDelegate
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockSignInService = nil
        mockDelegate = nil
        super.tearDown()
    }

    func testSignInUserWebService_Successful() throws {
        let signInRequest = SignInRequest(email: "eblanco@intekglobal.com", password: "123123")
        viewModel.signInRequest = signInRequest
        mockSignInService.mockResult = .success(SignInResponse(message: SuccessConstants.successfully_signed_in))
        
        let expectation = self.expectation(description: "ValidRequest_Returns_SuccessfulResponse")
        
        viewModel.signInUserWebServiceHandler { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response?.message)
                XCTAssertEqual(response?.message, SuccessConstants.successfully_signed_in)
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testSignInUserWebService_Failure() {
        let signInRequest = SignInRequest(email: "eblanco@intekglobal.com", password: "123123")
        viewModel.signInRequest = signInRequest
        mockSignInService.mockResult = .failure(APIError(message: ErrorConstants.error_signing_in))
        let expectation = self.expectation(description: "InvalidRequest_Returns_FailureResponse")
        
        viewModel.signInUserWebServiceHandler { result in
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.message, ErrorConstants.error_signing_in)
            default:
                XCTAssertNil(result)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

    
}
