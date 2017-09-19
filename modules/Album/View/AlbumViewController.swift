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

    var photos = [PhotoEntity]()

    lazy var cellWidth : CGFloat = {
        return self.view.frame.size.width
    }()
    
    lazy var cellHeight : CGFloat = {
        return self.view.frame.size.width * 1.2
    }()
    
    /// State restoration values.
    enum RestorationKeys : String {
        case collectionViewDataSourcePhotos
    }

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
    func showPhotos(Photos: [PhotoEntity]) {
        self.photos = Photos

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
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    /* footer space for last page can scroll align to top edge*/
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: cellWidth, height: self.view.frame.size.height - cellHeight)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell ///FIXME: rename to CollectionCell
        
        cell.set(photo: photos[indexPath.item])
        
        return cell
    }
}

// MARK: - paging
extension AlbumViewController {
    
    /* In case the user scrolls for a long swipe, the scroll view should animate to the nearest page when the scrollview decelerated. */
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollToPage(scrollView, withVelocity: CGPoint(x:0, y:0))
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        scrollToPage(scrollView, withVelocity: velocity)
    }
    
    func scrollToPage(_ scrollView: UIScrollView, withVelocity velocity: CGPoint) {
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

// MARK: - UIStateRestoration

extension AlbumViewController {
    override func applicationFinishedRestoringState() {
        print("finished restoring")
        collectionView?.reloadData()
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        // Encode the view state so it can be restored later.
        
        // Encode the collection view data source.
        coder.encode(photos, forKey:RestorationKeys.collectionViewDataSourcePhotos.rawValue)
        print("finished encodeRestorableState")
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        // Restore the active state:
        
        // Restore the collection view data source.
        if let storedValue = coder.decodeObject(forKey: RestorationKeys.collectionViewDataSourcePhotos.rawValue) as? [PhotoEntity] {
            photos = storedValue
        }
    }
}

