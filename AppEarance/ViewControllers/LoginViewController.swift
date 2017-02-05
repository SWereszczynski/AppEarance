//
//  LoginViewController.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 18.01.2017.

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var registerButton: RoundButton!
    @IBOutlet weak var lockImageView: UIImageView!
    @IBOutlet weak var humanImageView: UIImageView!
    @IBOutlet weak var loginTextField: LeftPaddingTextField!
    @IBOutlet weak var passwordTextField: LeftPaddingTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let transition = CircularTransaction()
    weak var delegate: LoginCoordinatorDelegate?
    
    init(withDelegate delegate: LoginCoordinatorDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.loginButton.isEnabled = false
        self.humanImageView.tintColor = UIColor.pastelGray()
        self.lockImageView.tintColor = UIColor.pastelGray()
        self.navigationController?.navigationBar.isHidden = true
        self.registerButton.backgroundColor = UIColor.pastelYellow()
    }
    
    @IBAction func loginTextFieldDidChange(_ sender: Any) {
        self.inputValidation()
    }
    
    @IBAction func passwordTextFieldDidChange(_ sender: Any) {
        self.inputValidation()
    }
    
    @IBAction func registerButtonDidTouch(_ sender: Any) {
        self.delegate?.startRegistration(startingPoint: self.registerButton.center)
    }
    
    @IBAction func loginButtonDidTouch(_ sender: Any) {
        self.delegate?.startPhotoPreview()
    }
    
    private func inputValidation() {
        if loginTextField.text!.isEmailValidate() && passwordTextField.text!.isPasswordValidate() {
            self.loginButton.isEnabled = true
        } else {
            self.loginButton.isEnabled = false
        }
    }
}
