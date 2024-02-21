//
//  HomeController.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/9/24.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var colllectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.colllectionView.dataSource = self
        self.colllectionView.delegate = self
       
        self.colllectionView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
       
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
            // Örnek data ile cell'i yapılandırın
            cell.configure(foodImageName: "baku", foodTitle: "Yemek Adı", foodSubtitle: "Yemek Alt Başlığı", time: "20 dk", calories: "250 kcal", service: "2 Kişilik")
            return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 348)
    }
    
    
}
