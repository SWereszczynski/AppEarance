//
//  LoginViewControllerTests.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 20.01.2017.


import Quick
import Nimble

@testable import AppEarance

class LoginViewControllerTests: QuickSpec {
    
    var sut: LoginViewController!
    
    override func spec() {
      
        describe("login view controller") {
            
            beforeEach {
                let loginCoordinator = LoginCoordinator(withNavigationController: UINavigationController())
                self.sut = LoginViewController(withDelegate: loginCoordinator)
                let _ = self.sut.view
            }
            
            afterEach {
                self.sut = nil
            }
            
            context("when view loads") {
                
                beforeEach {
                    self.sut.viewDidLoad()
                }
                
                it("should disable button") {
                    expect(self.sut.loginButton.isEnabled).to(beFalse())
                }
            }
        }
        
        describe("string extension") {
            
            context("email validation") {
                
                it("is success email validation") {
                    let email = "john@example.com"
                    expect(email.isEmailValidate()).to(beTrue())
                }
                it("is failure email validation") {
                    let email = "john@example.c"
                    expect(email.isEmailValidate()).to(beFalse())
                }
            }
            
            context("password validation") {
                
                it("is success password validation") {
                    let password = "12345678"
                    expect(password.isPasswordValidate()).to(beTrue())
                }
                it("is failure password validation") {
                    let password = "12345"
                    expect(password.isPasswordValidate()).to(beFalse())
                }
            }
        }
    }
}
