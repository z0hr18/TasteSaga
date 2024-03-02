//
//  IngredientCell.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/28/24.
//

import UIKit

class IngredientCell: UITableViewCell {
    
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var ingredientIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
