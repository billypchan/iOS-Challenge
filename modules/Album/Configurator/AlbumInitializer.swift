//
//  AlbumAlbumInitializer.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import UIKit

class AlbumModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var albumViewController: AlbumViewController!

    override func awakeFromNib() {

        let configurator = AlbumModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: albumViewController)
    }

}
