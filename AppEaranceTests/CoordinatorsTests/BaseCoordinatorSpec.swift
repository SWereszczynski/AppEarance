//
//  BaseCoordinatorSpec.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 26.01.2017.

import Quick
import Nimble

@testable import AppEarance

class BaseCoordinatorSpec: QuickSpec {
    
    var sut: BaseCoordinator!
    var navigationController: UINavigationController!
    
    override func spec() {
        
        describe("initialize with navigationController") {
            
            it("should init with navigation controller as a root") {
                
                self.navigationController = UINavigationController()
                self.sut = LoginCoordinator(withNavigationController: self.navigationController)
                
                expect(self.sut.rootController).to(beAnInstanceOf(UINavigationController.self))
            }
        }

    }
    
    
}
