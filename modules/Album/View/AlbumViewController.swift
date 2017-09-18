//
//  AlbumViewController.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import UIKit
import PKHUD

class AlbumViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var output: AlbumViewOutput!
    ///FIXME: save state,
    var imageURLs = [URL]()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }


    // MARK: AlbumViewInput
    func setupInitialState() {
    }
}

extension AlbumViewController: AlbumViewInput {
    func showImageURLs(imageURLs: [URL]) {
        self.imageURLs = imageURLs
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    func showError() {
        HUD.flash(.label("Error occurs"), onView: self.view, delay: 2.0)
    }
    
    func showLoading() {
        DispatchQueue.main.async {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

/** Collection view */
extension AlbumViewController {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let size = self.view.frame.size.width
        return CGSize(width: size, height: size)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell ///FIXME: rename to CollectionCell
        
        let url = imageURLs[indexPath.row]
        
        cell.set(imageURL: url)
        
        return cell
    }
}
