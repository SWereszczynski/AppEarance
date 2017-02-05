//
//  AppCoordinator.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 18.01.2017.

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    private var loginCoordinator: LoginCoordinator?
    
    convenience init(withWindow window: UIWindow?) {
        guard let mainWindow = window else {
            fatalError("Main window is not initialized")
        }
        let navigationController = UINavigationController()
        mainWindow.rootViewController = navigationController
        self.init(withNavigationController: navigationController)
    }
    
    override func start() {
        self.loginCoordinator = LoginCoordinator(withNavigationController: rootController)
        self.loginCoordinator?.start()
    }
    
}
