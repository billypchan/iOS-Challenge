//
//  AlbumAlbumPresenter.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

class AlbumPresenter: AlbumModuleInput, AlbumViewOutput, AlbumInteractorOutput {

    weak var view: AlbumViewInput!
    var interactor: AlbumInteractorInput!
    var router: AlbumRouterInput!

    func viewIsReady() {

    }
}
