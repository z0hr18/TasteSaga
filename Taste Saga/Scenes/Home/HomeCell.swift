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
    func configure(data: Recipe) {
        foodİmage.showImage(image: data.image)
        foodTitleLabel.text = data.label
//        let subtitleText = data.dishType?.joined(separator: ", ") ?? ""
//        foodSubtitleLabel.text = subtitleText
        foodSubtitleLabel.text = data.dishType?.first
//         if let time = time {
//            timeLabel.text = "\(Int(time))" + " minutes"
//        } else {
//            timeLabel.text = "Not available time"
//        }
        if let time = data.totalTime {
            if time == 0 {
                timeLabel.text = "30 minutes"
            } else {
                timeLabel.text = "\(Int(time)) minutes"
            }
        } else {
            timeLabel.text = "Not available time"
        }
        let caloriesPerPerson = Int(Double(data.calories) / Double(data.yield))
        caloriesLabel.text = "\(caloriesPerPerson)"
        serviceLabel.text = String(data.yield) + " people"
    }
}
