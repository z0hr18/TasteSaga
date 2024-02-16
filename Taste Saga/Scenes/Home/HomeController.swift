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
       
        self.colllectionView.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
                   
    }
}

extension HomeController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        5
    }
    
    
}
