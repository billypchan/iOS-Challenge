//
//  AlbumPresenterTests.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import XCTest

@testable import Coon

class AlbumPresenterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockViewController: AlbumViewInput {
        var Photos = [PhotoEntity]()
        var isError = false
        
        func showPhotos(Photos: [PhotoEntity]) {
            self.Photos = Photos
        }
        
        func showLoading() {
            
        }
        
        func hideLoading() {
            
        }
        
        func showError() {
            isError = true
        }
        
        
        func setupInitialState() {
            
        }
    }

    func testPresenterOnError_expectOnErrorCalls() {
        let viewController = MockViewController()

        let presenter = AlbumPresenter()
        presenter.view = viewController

        let interactor = MockInteractor()
        interactor.output = presenter
        
        interactor.output?.onError()

        XCTAssert(viewController.isError, "Presenter forwords error form intactor to view")
    }
    
    func testPresenter_expectListHas2Items() {
        let viewController = MockViewController()
        
        let presenter = AlbumPresenter()
        presenter.view = viewController
        
        let interactor = MockInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        
        presenter.viewIsReady()
        
        let count = viewController.Photos.count
        
        XCTAssert(count == 2, "got 2 Photos")
    }
    
}
