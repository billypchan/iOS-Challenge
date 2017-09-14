//
//  CollectionCell.swift
//  Coon
//
//  Created by chan bill on 14/9/2017.
//  Copyright © 2017 chan bill. All rights reserved.
//

import Foundation
import SDWebImage
import UIKit

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    func set(imageURL: URL?) {
        if imageURL == nil {
            imageView.image = nil
            return
        }
        
        // Load the image using SDWebImage
        imageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeHolder"))
    }
}
