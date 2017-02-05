//
//  SinglePhotoPreviewViewController.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 02.02.2017.

import UIKit
import Foundation

class SinglePhotoPreviewViewController: BaseViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    var imageUrl: URL!
    
    required init(imageUrl: URL) {
        super.init(nibName: nil, bundle: nil)
        self.imageUrl = imageUrl
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        self.photoImageView.downloadFromUrl(url: self.imageUrl)
        
        self.setupView()
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = 10
        self.scrollView.delegate = self
        
        if let url = self.imageUrl {
            
            self.photoImageView.downloadFromUrl(url: url)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupView() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
    }
}

extension SinglePhotoPreviewViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.photoImageView
    }
    
   
}
