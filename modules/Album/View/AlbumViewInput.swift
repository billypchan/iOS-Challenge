//
//  AlbumViewInput.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//
import Foundation

protocol AlbumViewInput: class {

    /**
        @author Bill, Chan Yiu Por
        Setup initial state of the view
    */

    func setupInitialState()

    // PRESENTER -> VIEW
    func showImageURLs(imageURLs :[URL])
    
    func showLoading()
    func hideLoading()
    func showError()
}
