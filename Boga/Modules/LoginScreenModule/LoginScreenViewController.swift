//
//  LoginScreenViewController.swift
//  Boga
//
//  Created by Aung Kyaw Phyo on 15/10/2024.
//

import UIKit

class LoginScreenViewController: BogaViewController {

    // MARK: - IBOutlets
    @IBOutlet var textFieldCollection: [BogaTextField]!
    @IBOutlet var errorLabelCollection: [UILabel]!
    
    @IBOutlet weak var phoneNoTextField: BogaTextField!
    @IBOutlet weak var passwordTextField: BogaTextField!
    
    @IBOutlet weak var phoneNoErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    var delegate: LoginScreenProtocols?
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        textFieldSetup()
    }
    
    private func textFieldSetup() {
        textFieldCollection.forEach({
            $0.delegate = self
        })
    }
    
    // MARK: - User Interaction - Actions & Targets
    @IBAction func forgotPasswordBtnAction(_ sender: UIButton) {
        debugPrint("Pressed forgot btn")
        // TODO: Actions & Targets
    }
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        debugPrint("Pressed register btn")
        // TODO: Actions & Targets
    }
    
    @IBAction func loginBtnAction(_ sender: BogaButton) {
        delegate?.clickedLoginButton(input: LoginInput.init(phoneNo: phoneNoTextField.inputValue, password: passwordTextField.inputValue))
        loginInputs(input: LoginInput(phoneNo: phoneNoTextField.inputValue, password: passwordTextField.inputValue))
    }

}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let textField = textField as? BogaTextField, let index = textFieldCollection.firstIndex(of: textField) {
            errorLabelCollection[index].text = ""
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == phoneNoTextField {
            phoneNoErrorLabel.text = ""
        } else {
            passwordErrorLabel.text = ""
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textField = textField as? BogaTextField, let index = textFieldCollection.firstIndex(of: textField) else {
            return true
        }
        guard index < textFieldCollection.count - 1 else {
            textFieldCollection[index].resignFirstResponder()
            return true
        }
        textFieldCollection[index + 1].becomeFirstResponder()
        return true
    }
    
}

extension LoginScreenViewController: LoginScreenProtocols {
    
    func clickedLoginButton(input: LoginInput) {
        loginInputs(input: input)
    }
    
    func validationErrorService(error: ValidationError) {
        if error == .phoneNoValidationError {
            phoneNoErrorLabel.text = error.rawValue
        } else if error == .passwordValidationError {
            passwordErrorLabel.text = error.rawValue
        }
    }
    
    private func loginInputs(input: LoginInput) {
        if phoneNoTextField.text == "9764374935" && passwordTextField.text == "12345678" {
            baseRouter()
        } else if phoneNoTextField.text != "9764374935" {
            validationErrorService(error: ValidationError.phoneNoValidationError)
        } else if  passwordTextField.text != "12345678" {
            validationErrorService(error: ValidationError.passwordValidationError)
        }
    }
    
    private func baseRouter() {
        let homeVC = HomeScreenViewController.instantiate(storyboard: .baseRouter)
        homeVC.modalTransitionStyle = .crossDissolve
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true)
    }
    
}
