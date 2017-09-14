//
//  AlbumAlbumViewController.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import UIKit

class AlbumViewController: UICollectionViewController {

    var output: AlbumViewOutput!
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
        collectionView?.reloadData()
    }
    
    func showImageURLAdded(url: URL) {
        if !self.imageURLs.contains(url) {
            self.imageURLs.insert(url, at: self.imageURLs.count)
            collectionView?.reloadData()
        }
    }
    
    func showError() {
        ///FIXME:
//        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        ///FIXME:
//        HUD.show(.progress)
    }
    
    func hideLoading() {
        ///FIXME:
//        HUD.hide()
    }
}

/** Collection view */
extension AlbumViewController {
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
