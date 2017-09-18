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

    var urls = [URL]()

    func viewIsReady() {
        interactor?.retrieveImageURLs()
        view?.showLoading()
    }
    
    func onError() {
        view?.showError()
    }
    
    func didRetrieveImageURLs(_ imageURLs: [URL]) {
        self.urls =  imageURLs

        view?.showImageURLs(imageURLs: imageURLs)
        view?.hideLoading()
    }
}
