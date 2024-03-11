//
//  CategoryViewController.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 3/7/24.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    var typeSearched: String? // Kategorinin adını tutacak değişken
    var recipes = [Recipe]() // API'den çekilen tariflerin saklanacağı dizi
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categoryCollection.delegate = self
        self.categoryCollection.dataSource = self
        self.categoryCollection.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        
        let backbutton = UIBarButtonItem(image: UIImage(named: "ic_arrow_back"), style: .plain, target: navigationController, action: #selector(UINavigationController.popViewController(animated:)))
        backbutton.tintColor = .black
        navigationItem.leftBarButtonItem = backbutton
        
        // eger category secilibse, o categorie aid yemekleri cekmek
        if let category = typeSearched {
            fetchRecipes(forCategory: category)
        }
    }

    func fetchRecipes(forCategory category: String) {
        APICaller.shared.getRecipes(searchTerm: category, type: "", hasType: false, const: false, urlConst: "") { [weak self] result in
            switch result {
            case .success(let apiResponse):
                self?.recipes = apiResponse.hits.map { $0.recipe }
                DispatchQueue.main.async {
                    self?.categoryCollection.reloadData()
//                    print("Yemekler: \(self?.recipes)")
                }
            case .failure(let error):
                print("Error fetching recipes: \(error)")
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: categoryCollection.frame.width, height: 348)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            fatalError("Unable to dequeue HomeCell")
        }
        
        cell.configure(data: recipes[indexPath.row])
        return cell
    }
}
//extension Recipe: CustomStringConvertible {
//    var description: String {
//        return "Recipe: \(label), \(calories) calori, \(ingredientLines.count)        "
//    }
//}
