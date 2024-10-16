//
//  LoginScreenProtocols.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 16/10/2024.
//

import Foundation

protocol LoginScreenProtocols: AnyObject {
    func clickedLoginButton(input: LoginInput)
    func validationErrorService(error: ValidationError)
}
