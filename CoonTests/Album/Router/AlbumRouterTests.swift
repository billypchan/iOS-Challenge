//
//  AlbumRouterTests.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import XCTest

@testable import Coon

class AlbumRouterTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRouter_expectAlbumViewControllerIsCreated(){
    let album = AlbumRouter.createModule()

        XCTAssertTrue(album.childViewControllers.first is AlbumViewController, "router created AlbumViewController")

    }
}
