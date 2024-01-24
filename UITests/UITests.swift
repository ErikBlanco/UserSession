//
//  UITests.swift
//  UITests
//
//  Created by Erik Blanco on 1/23/24.
//

import XCTest

final class UITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    /// When it comes to registering a user for testing purposes, how should account creation in a live service be managed? Create one in our actual data persistency service (firebase), and then delete it?
    func test_Register_User() throws {
        let app = XCUIApplication()
        app.launch()

        // Making sure we are not in the home page due to session persistency
        let signOutButton = app.buttons["signOutButton"]
        if signOutButton.exists {
            signOutButton.tap()
        }
        
        let generatedEmail = "\(UUID())@intekglobal.com"
        let generatedPassword = "\(Int.random(in: 100000...999999))"
        
        let landingPageRegisterButton = app.buttons["landingPageRegisterButton"]
        XCTAssertTrue(landingPageRegisterButton.exists)
        landingPageRegisterButton.tap()
        
        let registerEmailTextField = app.textFields["registerEmailTextField"]
        XCTAssertTrue(registerEmailTextField.exists)
        registerEmailTextField.tap()
        registerEmailTextField.typeText(generatedEmail)
        
        let registerPasswordTextField = app.textFields["registerPasswordTextField"]
        XCTAssertTrue(registerPasswordTextField.exists)
        registerPasswordTextField.tap()
        registerPasswordTextField.typeText(generatedPassword)
        
        let confirmPasswordTextField = app.textFields["confirmPasswordTextField"]
        XCTAssertTrue(confirmPasswordTextField.exists)
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText(generatedPassword)
        
        let registerButton2 = app.buttons["registerButton"]
        XCTAssertTrue(registerButton2.exists)
        registerButton2.tap()
        
        // As we are making a call to Firebase, we are temporarily waiting for 2 seconds.
        // TO DO: Proper async call testing
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for 2 second")], timeout: 2.0)
        
        let signInButton = app.buttons["signInButton"]
        XCTAssertTrue(signInButton.exists)
    }
    
    func test_Sign_In_User() throws {
        let app = XCUIApplication()
        app.launch()

        // Making sure we are not in the home page due to session persistency
        let tempSignOutButton = app.buttons["signOutButton"]
        if tempSignOutButton.exists {
            tempSignOutButton.tap()
        }
        
        let email = "eblanco@intekglobal.com"
        let password = "123123"
        
        let landingPageSignInButton = app.buttons["landingPageSignInButton"]
        XCTAssertTrue(landingPageSignInButton.exists)
        landingPageSignInButton.tap()
        
        let signInEmailTextField = app.textFields["signInEmailTextField"]
        XCTAssertTrue(signInEmailTextField.exists)
        signInEmailTextField.tap()
        signInEmailTextField.typeText(email)
        
        let signInPasswordTextField = app.textFields["signInPasswordTextField"]
        XCTAssertTrue(signInPasswordTextField.exists)
        signInPasswordTextField.tap()
        signInPasswordTextField.typeText(password)
        
        let signInButton = app.buttons["signInButton"]
        XCTAssertTrue(signInButton.exists)
        signInButton.tap()
        
        // As we are making a call to Firebase, we are temporarily waiting for 2 seconds.
        // TO DO: Proper async call testing
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for 2 second")], timeout: 2.0)
        
        let signOutButton = app.buttons["signOutButton"]
        XCTAssertTrue(signOutButton.exists)
    }
    
    func test_Register_Sign_In_And_Sign_Out_User() throws {
        let app = XCUIApplication()
        app.launch()

        // Making sure we are not in the home page due to session persistency
        let tempSignOutButton = app.buttons["signOutButton"]
        if tempSignOutButton.exists {
            tempSignOutButton.tap()
        }
        
        let generatedEmail = "\(UUID())@intekglobal.com"
        let generatedPassword = "\(Int.random(in: 100000...999999))"
        
        let landingPageRegisterButton = app.buttons["landingPageRegisterButton"]
        XCTAssertTrue(landingPageRegisterButton.exists)
        landingPageRegisterButton.tap()
        
        let registerEmailTextField = app.textFields["registerEmailTextField"]
        XCTAssertTrue(registerEmailTextField.exists)
        registerEmailTextField.tap()
        registerEmailTextField.typeText(generatedEmail)
        
        let registerPasswordTextField = app.textFields["registerPasswordTextField"]
        XCTAssertTrue(registerPasswordTextField.exists)
        registerPasswordTextField.tap()
        registerPasswordTextField.typeText(generatedPassword)
        
        let confirmPasswordTextField = app.textFields["confirmPasswordTextField"]
        XCTAssertTrue(confirmPasswordTextField.exists)
        confirmPasswordTextField.tap()
        confirmPasswordTextField.typeText(generatedPassword)
        
        let registerButton = app.buttons["registerButton"]
        XCTAssertTrue(registerButton.exists)
        registerButton.tap()
        
        // As we are making a call to Firebase, we are temporarily waiting for 2 seconds.
        // TO DO: Proper async call testing
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for 2 second")], timeout: 2.0)
        
        let signInEmailTextField = app.textFields["signInEmailTextField"]
        XCTAssertTrue(signInEmailTextField.exists)
        signInEmailTextField.tap()
        signInEmailTextField.typeText(generatedEmail)
        
        let signInPasswordTextField = app.textFields["signInPasswordTextField"]
        XCTAssertTrue(signInPasswordTextField.exists)
        signInPasswordTextField.tap()
        signInPasswordTextField.typeText(generatedPassword)
        
        let signInButton = app.buttons["signInButton"]
        XCTAssertTrue(signInButton.exists)
        signInButton.tap()
        
        // As we are making a call to Firebase, we are temporarily waiting for 2 seconds.
        // TO DO: Proper async call testing
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for 2 second")], timeout: 2.0)
        
        let signOutButton = app.buttons["signOutButton"]
        XCTAssertTrue(signOutButton.exists)
        signOutButton.tap()
        
        let landingPageRegisterButton2 = app.buttons["landingPageRegisterButton"]
        XCTAssertTrue(landingPageRegisterButton2.exists)
        
        let landingPageSignInButton = app.buttons["landingPageSignInButton"]
        XCTAssertTrue(landingPageSignInButton.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
