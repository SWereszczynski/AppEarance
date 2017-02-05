//
//  BaseCoordinator.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 26.01.2017.

import UIKit

class BaseCoordinator: NSObject, Coordinator {
    
    unowned var rootController: UINavigationController
    var childCoordinator: BaseCoordinator?
    
    required init(withNavigationController controller: UINavigationController) {
        self.rootController = controller
    }
    
    func start() {
        
    }
  
    deinit {
        print("\(type(of: self)) deinit")
    }
    
}
