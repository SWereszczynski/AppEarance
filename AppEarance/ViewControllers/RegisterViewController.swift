//
//  RegisterViewController.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 18.01.2017.

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var humanImageView: UIImageView!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var loginTextField: LeftPaddingTextField!
    @IBOutlet weak var passwordTextField: LeftPaddingTextField!
    @IBOutlet weak var registerButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.registerButton.isEnabled = false
        self.humanImageView.tintColor = UIColor.pastelWhite()
        self.lockImageView.tintColor = UIColor.pastelWhite()
    }
    
    @IBAction func loginTextFieldDidChange(_ sender: LeftPaddingTextField) {
        self.inputValidation()
    }
    
    @IBAction func passwordTextFieldDidChange(_ sender: LeftPaddingTextField) {
        self.inputValidation()
    }
    
    @IBAction func loginButtonDidTouch(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func inputValidation() {
        if loginTextField.text!.isEmailValidate() && passwordTextField.text!.isPasswordValidate() {
            self.registerButton.isEnabled = true
        } else {
            self.registerButton.isEnabled = false
        }
    }
}
