//
//  AlbumInteractor.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

class AlbumInteractor: AlbumInteractorInput {
    
    weak var output: AlbumInteractorOutput!
    
    ///FIXME: return a struct instead of URL
    func retrieveImageURLs() {
        
        FlickrApi.fetchPhotos(completion: {urls, error in
            
            if let downcastedURLs = urls as? [URL] {
                self.output.didRetrieveImageURLs(downcastedURLs)
            }
            else {
                self.output.onError() ///FIXME: reason
                print("error \(String(describing: error))")
            }
        })
    }
}
