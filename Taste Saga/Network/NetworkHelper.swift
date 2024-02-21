//
//  NetworkHelper.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/21/24.
//

import Foundation
import Alamofire

class NetworkHelper {
    static let baseURL = "https://api.edamam.com/v2/"
    static let apiKey = "05cefd6c071b6846ff87c5d5da10b95a"
    
    static func join(endpoint: String) -> String {
        return ("\(baseURL)\(endpoint)?api_key=\(apiKey)")
    }
}
 
