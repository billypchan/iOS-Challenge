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
    
    func didRetrieveImageURL(_ url: URL) {
        view?.hideLoading()
        view?.showImageURLAdded(url: url)
    }
    
    func didFinishUpload() {
        view?.hideLoading()
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}

