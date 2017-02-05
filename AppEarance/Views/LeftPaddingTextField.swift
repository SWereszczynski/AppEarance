//
//  LeftPaddingTextField.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 19.01.2017.
//  Copyright © 2017 zaven. All rights reserved.
//

import UIKit
    
class LeftPaddingTextField: UITextField {
    
    private let emptyView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLeftView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLeftView()
    }
    
    private func setupLeftView() {
        self.emptyView.frame = CGRect(x: 0, y: 0, width: 5, height: 1)
        self.leftView = self.emptyView
        self.leftViewMode = .always
    }
}
