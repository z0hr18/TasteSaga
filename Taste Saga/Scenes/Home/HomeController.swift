//
//  HomeController.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/9/24.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var colllectionView: UICollectionView!
    var recipes = [Recipe]()
    var recipeDetails: [FoodViewModel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRecipesFromAPI()
        
        self.navigationItem.title = "FLAVOR"
        self.colllectionView.dataSource = self
        self.colllectionView.delegate = self
       
        self.colllectionView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
    }
    func fetchRecipesFromAPI() {
        NetworkManager.fetchRecipes(query: "Christmas") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let apiResponse):
                    self?.recipes = apiResponse.hits.map { $0.recipe }
                    self?.colllectionView.reloadData()
                    
//                    print("Yemekler:")
                    for recipe in self?.recipes ?? [] {
//                        print(recipe)
                    }
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            return UICollectionViewCell()
        }
        cell.configure(data: recipes[indexPath.row])
//        cell.configure(
//               foodImageName: recipe.image,
//               foodTitle: recipe.label,
//               foodSubtitle: recipe.dishType,
//               time: recipe.totalTime,
//               calories: recipe.calories,
//               service: recipe.yield
//           )
            return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 348)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // selected recipei al
        let selectedRecipe = recipes[indexPath.row]
        
        // selected recipeden bir FoodViewModel duzeltmek
        let recipeDetailViewModel = FoodViewModel(
            uri: selectedRecipe.uri,
            title: selectedRecipe.label,
            subtitle: selectedRecipe.dishType?.first ?? "Unknown",
            imageURL: URL(string: selectedRecipe.image),
            time: selectedRecipe.totalTime == 0 ? 30 : selectedRecipe.totalTime ?? 30, // `totalTime` nildise yaxud 0 olsa 30 istifade elemek
            calories: selectedRecipe.calories,
            servings: selectedRecipe.yield,
            ingredients: selectedRecipe.ingredientLines,
            recipeURL: selectedRecipe.url,
            shareAs: selectedRecipe.shareAs,
            isFavorite: false // usere gore ayarlanacaq
        )

        
        // RecipeDetailsController'ı storyboard üzerinden yükle ve viewModel'i teyin elemek
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsVC = storyboard.instantiateViewController(withIdentifier: "RecipeDetailsController") as? RecipeDetailsController {
            // FoodViewModeldekileri RecipeDetailsController'a kocurmek
            detailsVC.recipeDetails = [recipeDetailViewModel]
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }

}

    
    

