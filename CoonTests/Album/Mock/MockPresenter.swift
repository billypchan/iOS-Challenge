//
//  MockPresenter.swift
//  CoonTests
//
//  Created by chan bill on 18/9/2017.
//  Copyright © 2017 CoonAndFriends. All rights reserved.
//

import Foundation
@testable import Coon

class MockPresenter: AlbumModuleInput, AlbumViewOutput, AlbumInteractorOutput {
    weak var view: AlbumViewInput!
    var interactor: AlbumInteractorInput!
    var router: AlbumRouterInput!

    var Photos = [PhotoEntity]()
    var isError = false

    func viewIsReady() {
        interactor?.retrievePhotos()
        view?.showLoading()
    }
    
    func onError() {
        view?.showError()
        isError = true
    }
    
    func didRetrievePhotos(_ Photos: [PhotoEntity]) {
        self.Photos =  Photos

        view?.showPhotos(Photos: Photos)
        view?.hideLoading()
    }
}
