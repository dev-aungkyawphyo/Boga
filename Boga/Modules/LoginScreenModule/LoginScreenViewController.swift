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
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
