//
//  AlbumRouter.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import UIKit

class AlbumRouter: AlbumRouterInput {
    class func createModule() -> UIViewController {
        let tabController = mainStoryboard.instantiateViewController(withIdentifier: "AlbumTabViewControllerID")
        if let view = tabController.childViewControllers.first as? AlbumViewInput {
            let configurator = AlbumModuleConfigurator()
            
            configurator.configureModuleForViewInput(viewInput: view)
            
            view.setupInitialState()
            
            return tabController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
