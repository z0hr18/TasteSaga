//
//  Image.swift
//  Taste Saga
//
//  Created by Zohra Guliyeva on 2/23/24.
//

import Foundation
import SDWebImage

extension UIImageView {
    func showImage(image: String?) {
        self.sd_setImage(with: URL(string: "\(image ?? "")"), placeholderImage: UIImage(named: "baku"))
    }
}
