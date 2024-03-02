//
//  RecipeDetailsController.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/24/24.
//

import UIKit

class RecipeDetailsController: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeType: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var ingredientsTitleLabel: UILabel!
    @IBOutlet weak var ingredientsTable: UITableView!
    
    
    var recipeDetails: [FoodViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
