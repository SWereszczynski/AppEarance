//
//  RoundButton.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 18.01.2017.
//  Copyright © 2017 zaven. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }

}
