//
//  String.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 19.01.2017.

import Foundation

extension String {
    
    func isEmailValidate() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
    func isPasswordValidate() -> Bool {
        return self.characters.count >= 8 ? true : false
    }
    
}
