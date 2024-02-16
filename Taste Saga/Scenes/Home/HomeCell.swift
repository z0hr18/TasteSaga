//
//  HomeCell.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/10/24.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var foodİmage: UICollectionView!
    
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodSubtitleLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

}

extension HomeCell {
//    func configure(foodİmage: String, foodTitleLabel: String, foodSubtitleLabel: String, timeLabel: String, caloriesLabel: String, serviceLabel: String ) {
//        titleLabel.text = title
//        imageLabel.image = UIImage(systemName: imageName)
//    }
}
