//
//  Users.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 3/2/24.
//

import UIKit

class Users: Codable {
    
    static let currentUser = Users()
    
    var username: String = ""
    var email: String = ""
    var password: String = ""
    var isLoggedIn: Bool = false
    var savedRecipes: [FoodViewModel] = []
    var index: Int = 0
    
}

