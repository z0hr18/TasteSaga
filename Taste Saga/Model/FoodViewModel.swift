//
//  FoodViewModel.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/24/24.
//

import Foundation

class FoodViewModel: Codable {//table cell
    
    let uri: String
    let title: String
    let subtitle: String
    let imageURL: URL?
    var imageData: Data? = nil
    let time: Double
    let calories: Double
    let servings: Int
    let ingredients: [String]
    let recipeURL: String
    let shareAs: String
    var isFavorite: Bool
    
    init(
        uri: String,
        title: String,
        subtitle: String,
        imageURL: URL?,
        time: Double,
        calories: Double,
        servings: Int,
        ingredients: [String],
        recipeURL: String,
        shareAs: String,
        isFavorite: Bool
    ) {
        self.uri = uri
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
        self.time = time
        self.calories = calories
        self.servings = servings
        self.ingredients = ingredients
        self.recipeURL = recipeURL
        self.shareAs = shareAs
        self.isFavorite = false
    }
}

