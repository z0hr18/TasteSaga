//
//  HomeCell.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/10/24.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var foodİmage: UIImageView!
    
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
    func configure(foodImageName: String, foodTitle: String, foodSubtitle: String, time: String, calories: String, service: String) {
        foodİmage.image = UIImage(named: "baku")
        foodTitleLabel.text = foodTitle
        foodSubtitleLabel.text = foodSubtitle
        timeLabel.text = time
        caloriesLabel.text = calories
        serviceLabel.text = service

    }
}
