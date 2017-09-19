//
//  AlbumInteractor.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

class AlbumInteractor: AlbumInteractorInput {
    
    weak var output: AlbumInteractorOutput!
    
    func retrievePhotos() {
        
        FlickrApi.fetchPhotos(completion: {photos, error in
            
            if let downcastedPhotos = photos as? [PhotoEntity] {
                self.output.didRetrievePhotos(downcastedPhotos)
            }
            else {
                self.output.onError() ///FIXME: reason
                print("error \(String(describing: error))")
            }
        })
    }
}
