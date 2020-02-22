//
//  Skillbox_m11__Tests_UITests.swift
//  Skillbox_m11 (Tests)UITests
//
//  Created by Kravchuk Sergey on 22.02.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import XCTest

class Skillbox_m11__Tests_UITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }
    override func tearDown() {
        app = nil
        super.tearDown()
    }

    func testBadInput() {
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()

        app.typeText("someerroremail.ru")
               
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        
        app.typeText("somesimplepassword")
        
        app.buttons["Return"].tap()
        
        let signupButton = app.buttons["Sign up"]
        let emailErrorLabel = app.staticTexts["Please, check the correctness of your email"]
        let passwordErrorLabel = app.staticTexts["Password must contain at least one digit"]
        
        XCTAssertFalse(signupButton.isEnabled)
        XCTAssertTrue(emailErrorLabel.exists)
        XCTAssertTrue(passwordErrorLabel.exists)
        
    }
    
    func testCompleteInput() {
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()

        app.typeText("Somemail@mail.ru")
               
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        
        app.typeText("HardToGuessPassword2000")
        
        app.buttons["Return"].tap()
        
        let signupButton = app.buttons["Sign up"]
        let emailErrorLabel = app.staticTexts["Please, check the correctness of your email"]
        let passwordErrorLabel = app.staticTexts["Password must contain at least one digit"]
        
        XCTAssertTrue(signupButton.isEnabled)
        XCTAssertFalse(emailErrorLabel.exists)
        XCTAssertFalse(passwordErrorLabel.exists)
        
        signupButton.tap()
        
        let congratulationsLabel = app.staticTexts["Congratulations!"]
        XCTAssertTrue(congratulationsLabel.exists)
        
    }
    
    func testHalfBadInput() {
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()

        app.typeText("Somemail@mail.ru")
               
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        
        app.typeText("pas1")
        
        app.buttons["Return"].tap()
        
        let signupButton = app.buttons["Sign up"]
        let emailErrorLabel = app.staticTexts["Please, check the correctness of your email"]
        let passwordErrorLabel = app.staticTexts["Password must contain more than 6 characters"]
        
        XCTAssertFalse(signupButton.isEnabled)
        XCTAssertFalse(emailErrorLabel.exists)
        XCTAssertTrue(passwordErrorLabel.exists)
    }
    
}
