//
//  RegistrationCoordinatorSpec.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 26.01.2017.

import Quick
import Nimble

@testable import AppEarance

class RegistrationCoordinatorSpec: QuickSpec {
    
    var sut: RegistrationCoordinator!
    var navigationController: UINavigationController!
    var startingPoint = CGPoint(x: 0.0, y: 0.0)
    
    override func spec() {
        
        beforeEach {
            self.navigationController = UINavigationController()
            self.sut = RegistrationCoordinator(withNavigationController: self.navigationController, withStartingPoint: self.startingPoint)
        }
        
        afterEach {
            self.navigationController = nil
            self.sut = nil
        }
        
        describe("start Registration flow") {
            
            it("should initialize with starting point") {
                
                expect(self.sut).toNot(beNil())
                expect(self.sut.startingPoint).toNot(beNil())
            }
            
            it("should push registerViewController on start") {
                self.sut.start()
                //TODO write tests for start method
            }
        }
        
    }
}
