//
//  HomeCell.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/10/24.
//

import UIKit
import SDWebImage

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var foodİmage: UIImageView!
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodSubtitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    
    var recipe = [RecipeLinks]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
}

extension HomeCell {
    func configure(foodImageName: String, foodTitle: String, foodSubtitle: [String]?, time: Double?, calories: Double, service: Int) {
        foodİmage.showImage(image: foodImageName)
        foodTitleLabel.text = foodTitle
        let subtitleText = foodSubtitle?.joined(separator: ", ") ?? ""
               foodSubtitleLabel.text = subtitleText
         if let time = time {
            timeLabel.text = "\(Int(time))" + " minutes"
        } else {
            timeLabel.text = "Not available time"
        }
        let caloriesPerPerson = Int(Double(calories) / Double(service))
        caloriesLabel.text = "\(caloriesPerPerson)"
        serviceLabel.text = String(service) + " people"
    }
}
