//
//  PexelsWebViewController.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 27.01.2017.

import UIKit

class PexelsWebViewController: BaseViewController {

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.pexels.com")!
        let requestObject = URLRequest(url: url)
        
        self.webView.loadRequest(requestObject)
        
    }
    
}
