//
//  PasswordType.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 16/10/2024.
//

import Foundation

enum PasswordType {
    
    case normalPassword
    
    var emptyPasswordError: Error {
        switch self {
        case .normalPassword:
            return PasswordValidationError.emptyPassword
        }
    }
    
    var shortPasswordError: Error {
        switch self {
        case .normalPassword:
            return PasswordValidationError.shortPassword
        }
    }
    
    var longPasswordError: Error {
        switch self {
        case .normalPassword:
            return PasswordValidationError.longPassword
        }
    }
    
    var passwordWithSpaceError: Error {
        switch self {
        case .normalPassword:
            return PasswordValidationError.passwordWithSpace
        }
    }
    
    var passwordWithNoAlphabetOrDigitError: Error {
        switch self {
        case .normalPassword:
            return PasswordValidationError.passwordWithNoAlphabetOrDigit
        }
    }
    
}
