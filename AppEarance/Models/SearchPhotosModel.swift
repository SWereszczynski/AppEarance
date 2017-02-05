//
//  SearchPhotosModel.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 29.01.2017.

import Foundation

class SearchPhotosModel: BaseModel {
    
    var page: NSNumber?
    var perPage: NSNumber?
    var totalResuts: NSNumber?
    var url: String?
    var nextPage: String?
    var photos: [PhotoModel] = []
    
    override func propertyMapping() -> [(String?, String?)] {
        return [("perPage", "per_page"),
                ("totalResuts", "total_results"),
                ("nextPage", "next_page")]
    }
    
}
