//
//  EmailValidator.swift
//  Skillbox_m11 (Tests)
//
//  Created by Kravchuk Sergey on 21.02.2020.
//  Copyright © 2020 Kravchuk Sergey. All rights reserved.
//

import Foundation

enum ValidatorResult: Equatable {
    case empty
    case valid
    case error(message: String)
    
}
protocol Validator {
    func check(inputIsValid input: String) -> ValidatorResult
}

struct EmailValidator: Validator {
    func check(inputIsValid input: String) -> ValidatorResult {
        if input.isEmpty { return .empty }
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        if predicate.evaluate(with: input) {
            return .valid
        } else {
            return .error(message: "Please, check the correctness of your email")
        }
    }
}

struct PasswordValidator: Validator {
    func check(inputIsValid input: String) -> ValidatorResult {
        if input.isEmpty { return .empty }
        if input.count < 6 {
            return .error(message: "Password must contain more than 6 characters")
        } else if !input.containsDigit() {
            return .error(message: "Password must contain at least one digit")
        } else if !input.containsLowercase() {
            return .error(message: "Password must contain at least one lowercase character")
        } else if !input.containsUppercase() {
            return .error(message: "Password must contain at least one uppercase character")
        }
        return .valid
    }
}


private extension String {
    func containsDigit() -> Bool {
        for char in self {
            if char.isNumber { return true }
        }
        return false
    }
    func containsLowercase() -> Bool {
        for char in self {
            if char.isLowercase { return true }
        }
        return false
    }
    func containsUppercase() -> Bool {
        for char in self {
            if char.isUppercase { return true }
        }
        return false
    }
}
