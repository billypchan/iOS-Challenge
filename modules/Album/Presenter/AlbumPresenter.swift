//
//  AlbumPresenter.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import Foundation

class AlbumPresenter: AlbumModuleInput, AlbumViewOutput {

    weak var view: AlbumViewInput!
    var interactor: AlbumInteractorInput!
    var router: AlbumRouterInput!

    func viewIsReady() {
        interactor?.retrieveImageURLs()
    }
}

extension AlbumPresenter: AlbumInteractorOutput {
    func didRetrieveImageURLs(_ imageURLs: [URL]) {
        view?.hideLoading()
        view?.showImageURLs(imageURLs: imageURLs)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}

