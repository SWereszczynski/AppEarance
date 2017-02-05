//
//  PhotoPreviewCoordinatorSpec.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 03.02.2017.


import Quick
import Nimble

@testable import AppEarance

class PhotoPreviewCoordinatorSpec: QuickSpec {
    
    var sut: PhotoPreviewCoordinator!
    var navigationController: UINavigationController!
    
    override func spec() {
        
        beforeEach {
            self.navigationController = UINavigationController()
            self.sut = PhotoPreviewCoordinator(withNavigationController: self.navigationController)
        }
        
        afterEach {
            self.navigationController = nil
            self.sut = nil
        }
        
        describe("initialize PhotoPreviewCoordinator") {
            it("should initialize correctly"){
                expect(self.sut).to(beAnInstanceOf(PhotoPreviewCoordinator.self))
            }
        }
        
        describe("PhotoPreviewCoordinator flow") {
            beforeEach {
                self.sut.start()
            }
            
            it("should start with photosPreviewController") {
                expect(self.sut.rootController.visibleViewController).toEventually(beAnInstanceOf(PhotosPreviewViewController.self))
            }
            
            it("should show PexelWebViewController") {
                self.sut.showPexelsWebView()
                
                expect(self.sut.rootController.visibleViewController).toEventually(beAnInstanceOf(PexelsWebViewController.self))
            }
            
            it("should show SinglePhotoPreview") {
                let url = URL(string: "testUrl")
                self.sut.showSinglePhotoPreview(withUrl: url!)
                
                expect(self.sut.rootController.visibleViewController).toEventually(beAnInstanceOf(SinglePhotoPreviewViewController.self))
            }
            
        }
        
    }
    
}
