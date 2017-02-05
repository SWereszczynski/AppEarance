//
//  AppCoordinatorSpec.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 20.01.2017.

import Quick
import Nimble

@testable import AppEarance

class AppCoordinatorSpec: QuickSpec {
    
    override func spec() {
        
        describe("init AppCordinator") {
            
            it("should throw assertion when initializing AppCordinator with nil instead of UIWindow") {
                
                //expect { AppCoordinator(withWindow: nil) }.to(throwAssertion())
            }
            
            it("should initialize with naviagation controller as a root controller") {
                
                let appCoordinator = AppCoordinator(withWindow: UIWindow())
                expect(appCoordinator.rootController).to(beAnInstanceOf(UINavigationController.self))
            }
        }
    }
}
