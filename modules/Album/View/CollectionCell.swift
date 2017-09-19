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
    
    weak var parentViewController : UIViewController!
    
    func set(photo: PhotoEntity?, parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        
        // Load the image using SDWebImage
        imageView.sd_setImage(with: photo?.url, placeholderImage: UIImage(named: "placeHolder"))
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(sender:)))
        imageView.addGestureRecognizer(tap)

        labelTitle.text = photo?.title
    }
}

extension CollectionCell {
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissFullscreenImage(sender:)))
        newImageView.addGestureRecognizer(tap)
        
        ///TODO: animation
        parentViewController.view.addSubview(newImageView)
        parentViewController.navigationController?.isNavigationBarHidden = true
        parentViewController.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(sender: UITapGestureRecognizer) {
        ///TODO: animation
        parentViewController.navigationController?.isNavigationBarHidden = false
        parentViewController.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
}
