//
//  LoginCoordinator.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 18.01.2017.

import UIKit

protocol LoginCoordinatorDelegate: class {
    
    func startRegistration(startingPoint: CGPoint)
    func dismissRegistration()
    
    func startPhotoPreview()
}

class LoginCoordinator: BaseCoordinator {
    
    let transition = CircularTransaction()
    fileprivate var registrationCoordinator: RegistrationCoordinator?
    fileprivate var photoPreviewCoordinator: PhotoPreviewCoordinator?
    
    override func start() {
        let loginViewController = LoginViewController(withDelegate: self)
        self.rootController.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    
    func startPhotoPreview() {
        let photoPreviewNavigationController = UINavigationController()
        
        self.photoPreviewCoordinator = PhotoPreviewCoordinator(withNavigationController: photoPreviewNavigationController)
        self.childCoordinator = self.photoPreviewCoordinator
        self.childCoordinator?.start()
        self.rootController.present(photoPreviewNavigationController, animated: true, completion: nil)
    }
    
    func startRegistration(startingPoint: CGPoint) {

        self.registrationCoordinator = RegistrationCoordinator(withNavigationController: self.rootController, withStartingPoint: startingPoint)
        self.childCoordinator = self.registrationCoordinator
        self.childCoordinator?.start()
    }
    
    func dismissRegistration() {
        if let coordinator = self.registrationCoordinator {
            self.childCoordinator = nil
            self.registrationCoordinator = nil
            coordinator.stop()
        }
    }
    
}
