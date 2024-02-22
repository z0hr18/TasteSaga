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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRecipesFromAPI()
        
        
        self.colllectionView.dataSource = self
        self.colllectionView.delegate = self
       
        self.colllectionView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
    }
    func fetchRecipesFromAPI() {
           // "Christmas" veya kullanıcı tarafından belirlenen bir sorgu ile API'den tarifleri çek
           NetworkManager.fetchRecipes(query: "Christmas") { result in
               DispatchQueue.main.async {
                   switch result {
                   case .success(let apiResponse):
                       // Başarılı yanıt alındı, UI'ı güncelle
                       self.recipes = apiResponse.hits.map { $0.recipe } // Diziyi güncelle
                       self.collectionView.reloadData() // Kole
                       print("Başarılı! Toplam tarif sayısı: \(apiResponse.count)")
                       // Burada elde edilen tarifleri kullanarak UI'ı güncelleyebilirsiniz. Örneğin, bir tableView güncelleyebilirsiniz.
                   case .failure(let error):
                       // Hata oluştu, kullanıcıya bir hata mesajı göster
                       print("Hata: \(error.localizedDescription)")
                       // Bir UIAlertController ile hata mesajını gösterebilirsiniz.
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell esle {
            return UICollectionViewCell()
        }
        let recipe = recipes[indexPath.row]
        cell.configure(
               foodImageName: recipe.image,
               foodTitle: recipe.title,
               foodSubtitle: recipe.subtitle,
               time: recipe.time,
               calories: recipe.calories,
               service: recipe.service
           )
            return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 348)
    }
    
    
}
