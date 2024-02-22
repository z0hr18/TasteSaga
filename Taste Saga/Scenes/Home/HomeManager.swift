//
//  HomeManager.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/21/24.
//

import Foundation

import Foundation
import Alamofire

//class HomeManager: HomeUseCase {
//    func getRecipes(query: String, pageNumber: Int, completion: @escaping (APIResponse?, String?) -> Void) {
//        // 'from' ve 'to' parametrelerini hesapla
//        let from = pageNumber * 10
//        let to = (pageNumber + 1) * 10 - 1
//
//        // Endpoint URL'ini oluştur
//        let endpoint = "\(NetworkHelper.baseURL)recipes/search"
//        
//        // Sorgu parametrelerini ayarla
//        let parameters: Parameters = [
//            "q": query,
//            "app_id": NetworkHelper.appID,
//            "app_key": NetworkHelper.appKey,
//            "from": "\(from)",
//            "to": "\(to)"
//        ]
//        
//        // NetworkManager kullanarak API isteğini yap
//        NetworkManager.request(model: APIResponse.self,
//                               endpoint: endpoint,
//                               parameters: parameters,
//                               encoding: URLEncoding.queryString) { response, error in
//            if let error = error {
//                completion(nil, error.localizedDescription)
//            } else if let response = response {
//                completion(response, nil)
//            }
//        }
//    }
//}
