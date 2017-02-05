//
//  BaseViewController.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 27.01.2017.

import UIKit
import IQKeyboardManager

class BaseViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
    }
}
