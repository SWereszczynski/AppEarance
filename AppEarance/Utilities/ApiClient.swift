//
//  ApiClient.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 27.01.2017.

import UIKit
import Alamofire

class ApiClient {
    
    static let API_URL = "https://api.pexels.com/v1/"
    
    static func GET(method: String, completionHandler:@escaping (_ json: String) -> (), errorHandler:@escaping (_ error: Error) -> ()) {
        
        let path = API_URL + method
        
        Alamofire.request(path, headers: ApiClient.getHeader()).validate().responseString { response in
            switch response.result {
            case .success:
                
                if let jsonString = response.result.value {
                    completionHandler(jsonString)
                }
               // print(response.description)
            case .failure(let error):
                errorHandler(error)
                //print(error)
            }
        }       
        
    }
    
    private static func getHeader() -> [String: String] {
        var header = [String: String]()
        header["Authorization"] = "" //place for authorization key from pexels API
        return header
    }
    
}
