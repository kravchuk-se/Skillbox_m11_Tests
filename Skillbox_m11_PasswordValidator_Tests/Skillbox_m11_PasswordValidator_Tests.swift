//
//  Skillbox_m11_PasswordValidator_Tests.swift
//  Skillbox_m11_PasswordValidator_Tests
//
//  Created by Kravchuk Sergey on 22.02.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import XCTest
@testable import Skillbox_m11__Tests_

class Skillbox_m11_PasswordValidator_Tests: XCTestCase {

    var sut: PasswordValidator!

    override func setUp() {
        super.setUp()
        
        sut = PasswordValidator()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testValidator() {
        
        XCTAssertFalse(sut.check(inputIsValid: "1234567") == .valid)
        XCTAssertFalse(sut.check(inputIsValid: "simplepassword") == .valid)
        XCTAssertFalse(sut.check(inputIsValid: "123") == .valid)
        XCTAssertTrue(sut.check(inputIsValid: "StrongPassword2020") == .valid)
        
    }

}
