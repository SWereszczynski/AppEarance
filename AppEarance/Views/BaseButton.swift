//
//  BaseButton.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 19.01.2017.
//  Copyright © 2017 zaven. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.isEnabled == false {
            self.alpha = 0.4
        } else {
            self.alpha = 1
        }
    }
}
