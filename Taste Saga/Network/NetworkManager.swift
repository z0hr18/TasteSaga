//
//  NetworkManager.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/21/24.
//

import Foundation
import Alamofire

import Foundation
import Alamofire

class NetworkManager {
    
    static func fetchRecipes(query: String, completion: @escaping (Result<APIResponse, Error>) -> Void) {
        let url = NetworkHelper.baseURL
        let parameters: [String: Any] = [
            "type": NetworkHelper.type,
            "app_id": NetworkHelper.appID,
            "app_key": NetworkHelper.appKey,
            "q": query
        ]
        
        AF.request(url, parameters: parameters).responseDecodable(of: APIResponse.self) { response in
            switch response.result {
            case .success(let apiResponse):
                completion(.success(apiResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

