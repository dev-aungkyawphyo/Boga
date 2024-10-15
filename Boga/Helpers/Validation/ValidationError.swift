//
//  ValidationError.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 16/10/2024.
//

import Foundation

enum PhoneNoValidationError: String, Error {
    case emptyPhoneNo = "pnve_emptyPhoneNo"
    case shortPhoneNo = "pnve_shortPhoneNo"
    case longPhoneNo = "pnve_longPhoneNo"
    case phoneNoWithInvalidChars = "pnve_phoneNoWithInvalidChars"
}

enum LoginPasswordValidationError: String, Error {
    case emptyPassword = "lpve_emptyPassword"
}

enum PasswordValidationError: String, Error {
    case emptyPassword = "pve_emptyPassword"
    case shortPassword = "pve_shortPassword"
    case longPassword = "pve_longPassword"
    case passwordWithSpace = "pve_passwordWithSpace"
    case passwordWithNoAlphabetOrDigit = "pve_passwordWithNoAlphabetOrDigit"
}
