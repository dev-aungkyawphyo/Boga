//
//  ValidationService.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 16/10/2024.
//

import Foundation

struct ValidationService {
    
    static let shared = ValidationService()
    
    func isValidPhoneNo(phoneNo: String?) -> Result<String, PhoneNoValidationError> {
        guard let phoneNo = phoneNo, !phoneNo.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return .failure(.emptyPhoneNo) }
        guard phoneNo ~= "^.{7,}$" else { return .failure(.shortPhoneNo) }
        guard phoneNo ~= "^.{7,12}$" else { return .failure(.longPhoneNo) }
        guard phoneNo ~= "^[0-9]{7,12}$" else { return .failure(.phoneNoWithInvalidChars) }
        return .success("")
    }
    
    func isValidLoginPassword(password: String?) -> Result<String, LoginPasswordValidationError> {
        guard let password = password, !password.isEmpty else { return .failure(.emptyPassword) }
        return .success("")
    }
    
    func isValidPassword(passwordType: PasswordType, password: String?) -> Result<String, Error> {
        guard let password = password, !password.isEmpty else {
            return .failure(passwordType.emptyPasswordError)
        }
        guard password ~= "^.{8,}$" else {
            return .failure(passwordType.shortPasswordError)
        }
        guard password ~= "^.{8,18}$" else {
            return .failure(passwordType.longPasswordError)
        }
        guard password ~= "^(?=.*[A-Za-z])(?=.*\\d).{8,18}$" else {
            return .failure(passwordType.passwordWithNoAlphabetOrDigitError)
        }
        return .success("")
    }
    
}