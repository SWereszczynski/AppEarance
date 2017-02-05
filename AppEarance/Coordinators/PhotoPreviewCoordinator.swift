//
//  PhotoPreviewCoordinator.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 27.01.2017.

import UIKit

protocol PhotoPreviewCoordinatorDelegate: class {
    func showPexelsWebView()
    func showSinglePhotoPreview(withUrl url: URL)
}

class PhotoPreviewCoordinator: BaseCoordinator {
    
    var pexelsWebViewController: PexelsWebViewController?
    var photosPreviewViewController: PhotosPreviewViewController?
    var singlePhotoPreviewViewController: SinglePhotoPreviewViewController?
    
    override func start() {
        self.photosPreviewViewController = PhotosPreviewViewController(withDelegate: self)
        self.rootController.pushViewController(photosPreviewViewController!, animated: true)
    }
    
}

extension PhotoPreviewCoordinator: PhotoPreviewCoordinatorDelegate {
    
    func showPexelsWebView() {
        self.pexelsWebViewController = PexelsWebViewController()
        self.rootController.pushViewController(pexelsWebViewController!, animated: true)
    }
    
    func showSinglePhotoPreview(withUrl url: URL) {
        self.singlePhotoPreviewViewController = SinglePhotoPreviewViewController(imageUrl: url)
        self.rootController.pushViewController(singlePhotoPreviewViewController!, animated: true)
    }
}
