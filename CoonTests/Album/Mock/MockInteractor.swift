//
//  MockInteractor.swift
//  CoonTests
//
//  Created by chan bill on 18/9/2017.
//  Copyright © 2017 CoonAndFriends. All rights reserved.
//

import Foundation
@testable import Coon

class MockInteractor: AlbumInteractorInput {
    weak var output: AlbumInteractorOutput?
    
    func retrievePhotos() {
        let url1 = URL(string:"http://localhost")!
        let url2 = URL(string:"http://localhost")!
        
        
        let Photos = [PhotoEntity(title:"title1", url:url1), PhotoEntity(title:"title2", url:url2)]
        
        self.output?.didRetrievePhotos(Photos)
    }
    
}
