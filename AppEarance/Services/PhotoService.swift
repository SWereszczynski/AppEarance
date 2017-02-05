//
//  PhotoService.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 28.01.2017.

import Foundation

protocol PhotoServiceDelegate: class {
    
    func photosSearched(searchPhotosModel: SearchPhotosModel)
    
    func errorCatched(error: Error)
}

class PhotoService {
    
    weak var delegate: PhotoServiceDelegate?
    
    func searchPhotos(withTag query: String) {
        
        //build method
        let method =  "search?query=\(query)+query&per_page=15&page=1"
        
        ApiClient.GET(method: method, completionHandler: { (jsonString) in
            print(jsonString)
            let searchPhotosModel = SearchPhotosModel(json: jsonString)
            

            self.delegate?.photosSearched(searchPhotosModel: searchPhotosModel)
        }) { (error) in
            self.delegate?.errorCatched(error: error)
        }
        
    }
    
}
