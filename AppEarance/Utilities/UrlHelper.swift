//
//  UrlHelper.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 02.02.2017.

import Foundation

class UrlHelper {
    
    static func findUrlInArray(array: [UrlsModel], indexPathRow: Int) -> UrlsModel? {
        
        for (index, urlModel) in array.enumerated() {
            
            if index == indexPathRow {
                return urlModel
            }
        }
        
        return nil
    }
    
}
