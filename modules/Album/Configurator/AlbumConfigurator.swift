//
//  AlbumAlbumConfigurator.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import UIKit

class AlbumModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? AlbumViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: AlbumViewController) {

        let router = AlbumRouter()

        let presenter = AlbumPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = AlbumInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
