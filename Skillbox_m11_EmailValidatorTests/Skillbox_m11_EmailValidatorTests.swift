//
//  Skillbox_m11_EmailValidatorTests.swift
//  Skillbox_m11_EmailValidatorTests
//
//  Created by Kravchuk Sergey on 22.02.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import XCTest
@testable import Skillbox_m11__Tests_

class Skillbox_m11_EmailValidatorTests: XCTestCase {

    var sut: EmailValidator!

    override func setUp() {
        super.setUp()
        
        sut = EmailValidator()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testValidator() {
        
        XCTAssertFalse(sut.check(inputIsValid: "sdfsdf") == .valid)
        XCTAssertFalse(sut.check(inputIsValid: "1@sdf") == .valid)
        XCTAssertFalse(sut.check(inputIsValid: "asd@a.r") == .valid)
        XCTAssertTrue(sut.check(inputIsValid: "johnappleseed@apple.com") == .valid)
        
    }
    
}
