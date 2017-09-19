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
    
    lazy var cellSize : CGFloat = {
        return self.view.frame.size.width
    }()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }


    // MARK: AlbumViewInput
    func setupInitialState() {
        ///FIXME: state restore
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
        return CGSize(width: cellSize, height: cellSize)
    }
    
    /* more footer space for last page */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: cellSize, height: self.view.frame.size.height - cellSize)
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

/* paging */
extension AlbumViewController {
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollToPage(scrollView, withVelocity: CGPoint(x:0, y:0))
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        scrollToPage(scrollView, withVelocity: velocity)
    }
    
    func scrollToPage(_ scrollView: UIScrollView, withVelocity velocity: CGPoint) {
        let cellHeight: CGFloat = cellSize
        let cellPadding: CGFloat = 10
        /* padding for status bar*/
        let topPadding: CGFloat = 20

        var page: Int = Int((scrollView.contentOffset.y - cellHeight / 2) / (cellHeight + cellPadding) + 1)
        if velocity.y > 0 {
            page += 1
        }
        if velocity.y < 0 {
            page -= 1
        }
        page = max(page, 0)
        let newOffset: CGFloat = CGFloat(page) * (cellHeight + cellPadding) - topPadding
        
        scrollView.setContentOffset(CGPoint(x:0, y:newOffset), animated: true)
    }
}
