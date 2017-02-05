//
//  Coordinator.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 18.01.2017.

import UIKit


protocol Coordinator: class {
    
    unowned var rootController: UINavigationController { get }
    
    init(withNavigationController controller: UINavigationController)
    
    func start()
    
    func stopChild()
}

extension Coordinator {
    
    func stopChild() {}
}
