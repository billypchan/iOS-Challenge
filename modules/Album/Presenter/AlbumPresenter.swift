//
//  AlbumPresenter.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import Foundation

class AlbumPresenter: AlbumModuleInput {
    weak var view: AlbumViewInput!
    var interactor: AlbumInteractorInput!
    var router: AlbumRouterInput!
}

extension AlbumPresenter: AlbumViewOutput {
    func refresh() {
        interactor?.retrievePhotos()
    }
    
    func viewIsReady() {
        interactor?.retrievePhotos()
    }
}

extension AlbumPresenter: AlbumInteractorOutput {
    func didRetrievePhotos(_ Photos: [PhotoEntity]) {
        view?.hideLoading()
        view?.showPhotos(Photos: Photos)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}

