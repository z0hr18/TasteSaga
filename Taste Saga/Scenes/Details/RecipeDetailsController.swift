//
//  RecipeDetailsController.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/24/24.
//

import UIKit

class RecipeDetailsController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeType: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var ingredientsTitleLabel: UILabel! //bunu add ele displayRecipeDetails-a
    @IBOutlet weak var ingredientsTable: UITableView!
    
    
    var recipeDetails: [FoodViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // TableView dataSource ve delegate
               ingredientsTable.dataSource = self
               ingredientsTable.delegate = self
               
               // eger varsa, ilk recipe detailini goster
               if let recipe = recipeDetails.first {
                   displayRecipeDetails(recipe)
               }
           }
           
           // recipe detallarini UI elementlerinde goster
           func displayRecipeDetails(_ recipe: FoodViewModel) {
               recipeTitle.text = recipe.title
               recipeType.text = recipe.subtitle
               timeLabel.text = "\(recipe.time) minutes"
               caloriesLabel.text = "\(recipe.calories) calories"
               servingsLabel.text = "\(recipe.servings) servings"
               // image varsa, UIImage 
               recipeImage.showImage(image: recipe.imageURL?.absoluteString)
               // tablei yenile
               ingredientsTable.reloadData()
           }

           // MARK: - UITableViewDataSource Methods
           
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return recipeDetails.first?.ingredients.count ?? 0
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
               
               if let ingredient = recipeDetails.first?.ingredients[indexPath.row] {
                   cell.ingredientLabel.text = ingredient
                   cell.ingredientIcon.image = UIImage(named: "ingredientIconName") //icon yuklememishem
               }
               
               return cell
           }
       }
