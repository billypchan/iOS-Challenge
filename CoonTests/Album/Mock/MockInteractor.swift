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
    
    func retrieveImageURLs() {
        let url1 = URL(string:"http://localhost")!
        let url2 = URL(string:"http://localhost")!
        
        
        let urls = [url1, url2]
        
        self.output?.didRetrieveImageURLs(urls)
    }
    
}
