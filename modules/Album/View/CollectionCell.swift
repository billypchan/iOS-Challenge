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
    
    weak var parentViewController : FullScreenProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let tap = UITapGestureRecognizer(target: self, action: #selector(CollectionCell.imageTapped(sender:)))
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        parentViewController.showFullScreenImageWhenTapped(sender: sender, image: imageView.image ?? UIImage(named: "placeHolder")!)
    }

    func set(photo: PhotoEntity?, parentViewController: AlbumViewController) {
        self.parentViewController = parentViewController
        
        // Load the image using SDWebImage
        imageView.sd_setImage(with: photo?.url, placeholderImage: UIImage(named: "placeHolder"))

        labelTitle.text = photo?.title
    }
}

