//
//  AlbumAlbumViewController.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController, AlbumViewInput {

    var output: AlbumViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: AlbumViewInput
    func setupInitialState() {
    }
}
