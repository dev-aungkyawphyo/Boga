//
//  ValidationService.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 16/10/2024.
//

import Foundation

enum ValidationError: String {
    case phoneNoValidationError = "Phone number is incorrect."
    case passwordValidationError = "Password is incorrect."
    
    var validate: String {
        self.rawValue
    }
    
}
