//
//  LoginCoordinatorSpec.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 25.01.2017. 

import Nimble
import Quick

@testable import AppEarance

class LoginCoordinatorSpec: QuickSpec {
    
    var sut: LoginCoordinator!
    var navigationController: UINavigationController!
    
    override func spec() {
        
        describe("navigation") {
            
            beforeEach {
                self.navigationController = UINavigationController()
                self.sut = LoginCoordinator(withNavigationController: self.navigationController)
                self.sut.start()
            }
            
            afterEach {
                self.navigationController = nil
                self.sut = nil
            }
            
            it("should initialize with LoginViewController") {
                expect(self.sut.rootController.visibleViewController).toEventually(beAnInstanceOf(LoginViewController.self))
            }
            
            it("should start photoPreview") {
                self.sut.startPhotoPreview()
                
                expect(self.sut.childCoordinator).to(beAnInstanceOf(PhotoPreviewCoordinator.self))
                expect(self.sut.rootController).toEventually(beAnInstanceOf(UINavigationController.self))
            }
            
            it("should start RegistrationCoordinator") {
                let startingPoint = CGPoint(x: 0.0, y: 0.0)
                self.sut.startRegistration(startingPoint: startingPoint)
            
                expect(self.sut.childCoordinator).to(beAnInstanceOf(RegistrationCoordinator.self))
            }
            
            it("should stop Registration Coordinator") {
                let startingPoint = CGPoint(x: 0.0, y: 0.0)
                self.sut.startRegistration(startingPoint: startingPoint)
                self.sut.dismissRegistration()
                expect(self.sut.childCoordinator).toEventually(beNil())
            }
            
        }
    }
}
