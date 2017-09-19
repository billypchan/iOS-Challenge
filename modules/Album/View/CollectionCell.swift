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
    @IBOutlet weak var labelTitle: UILabel!
    
    func set(photo: PhotoEntity?) {
        // Load the image using SDWebImage
        imageView.sd_setImage(with: photo?.url, placeholderImage: UIImage(named: "placeHolder"))

        labelTitle.text = photo?.title
    }
}
