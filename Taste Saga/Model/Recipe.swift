//
//  Recipe.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/21/24.
//

import Foundation

import Alamofire

final class APICaller {
    
    // enum for error checking the network call
    enum NetworkError: Error {
        case statusIncorrect
        case dataMissing
        case urlMalformed
        case decodingFailed(_ error: Error)
        case unknown(_ error: Error)
    }
    

    static let shared = APICaller()

    private init() {}

    public func getRecipes(searchTerm: String, type: String, hasType: Bool, const: Bool, urlConst: String, completion: @escaping (Result<APIResponse, NetworkError>) -> Void) {

        let url: URL
        if const, let urlConstURL = URL(string: urlConst) {
            url = urlConstURL
        } else {
            var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "api.edamam.com"
            urlComponents.path = "/api/recipes/v2"
            var queryItems = [
                URLQueryItem(name: "type", value: "public"),
                URLQueryItem(name: "q", value: searchTerm),
                URLQueryItem(name: "app_id", value: "2baa7828"),
                URLQueryItem(name: "app_key", value: "05cefd6c071b6846ff87c5d5da10b95a")
            ]
            if hasType {
                queryItems.append(URLQueryItem(name: "dishType", value: type))
            }
            urlComponents.queryItems = queryItems

            guard let urlConstructed = urlComponents.url else {
                completion(.failure(.urlMalformed))
                return
            }
            url = urlConstructed
        }

        AF.request(url).validate().responseDecodable(of: APIResponse.self) { response in
            switch response.result {
            case .success(let apiResponse):
                completion(.success(apiResponse))
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .responseSerializationFailed(reason: .decodingFailed):
                        completion(.failure(.decodingFailed(error)))
                    default:
                        completion(.failure(.unknown(error)))
                    }
                } else {
                    completion(.failure(.unknown(error)))
                }
            }
        }
    }
}


struct APIResponse: Codable {
    let hits: [RecipeLinks]
    let _links: NextLink
    let from: Int
    let to: Int
    let count: Int
}

struct RecipeLinks: Codable {
    let recipe: Recipe
}

struct Recipe: Codable {
    let uri: String
    let label: String
    let image: String
    let url: String
    let shareAs: String
    let yield: Int
    let dishType: [String]?
    let ingredientLines: [String]
    let calories: Double
    let totalTime: Double?
    let cuisineType: [String]?
}

struct NextLink: Codable {
    let next: Next?
}

struct Next: Codable {
    let href: String
    let title: String
}
