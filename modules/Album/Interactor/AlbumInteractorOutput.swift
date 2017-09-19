//
//  AlbumInteractorOutput.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import Foundation

protocol AlbumInteractorOutput: class {
    // INTERACTOR -> PRESENTER
    func didRetrievePhotos(_ Photos: [PhotoEntity])
    
    func onError()
}
