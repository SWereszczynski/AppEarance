//
//  RegistrationCoordinator.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 25.01.2017.

import UIKit

class RegistrationCoordinator: BaseCoordinator {
    
    let transition = CircularTransaction()
    var startingPoint: CGPoint?
    
    convenience init(withNavigationController controller: UINavigationController, withStartingPoint point: CGPoint) {
        self.init(withNavigationController: controller)
        self.startingPoint = point
    }
    
    override func start() {
        let registerViewController = RegisterViewController()
        registerViewController.transitioningDelegate = self
        self.rootController.present(registerViewController, animated: true, completion: nil)
    }
    
    func stop() {
        self.rootController.dismiss(animated: true, completion: nil)
    }
}

extension RegistrationCoordinator: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if let point = self.startingPoint {
            self.transition.startingPoint = point
        }
        self.transition.circleColor = UIColor.pastelYellow()
        self.transition.animationSpeed = 0.5
        return self.transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if let point = self.startingPoint {
            self.transition.startingPoint = point
        }
        self.transition.circleColor = UIColor.pastelGray()
        self.transition.animationSpeed = 0.5
        return self.transition
    }
}
