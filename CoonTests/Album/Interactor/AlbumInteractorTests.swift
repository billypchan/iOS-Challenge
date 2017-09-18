//
//  AlbumInteractorTests.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import XCTest
@testable import Coon

class AlbumInteractorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInteractorRetrieveImageURLs_expectURLIsRetrived() {
        let presenter = MockPresenter()
        
        let interactor = AlbumInteractor()
        interactor.output = presenter
        
        interactor.retrieveImageURLs()
        
        let expect = expectation(description: "receive urls operation")
        
        let deadlineTime = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            XCTAssert(presenter.urls.count > 0, "Retrieved URLs")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 60)
    }
}
