//
//  AlbumAlbumConfiguratorTests.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import XCTest

class AlbumModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = AlbumViewControllerMock()
        let configurator = AlbumModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "AlbumViewController is nil after configuration")
        XCTAssertTrue(viewController.output is AlbumPresenter, "output is not AlbumPresenter")

        let presenter: AlbumPresenter = viewController.output as! AlbumPresenter
        XCTAssertNotNil(presenter.view, "view in AlbumPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in AlbumPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is AlbumRouter, "router is not AlbumRouter")

        let interactor: AlbumInteractor = presenter.interactor as! AlbumInteractor
        XCTAssertNotNil(interactor.output, "output in AlbumInteractor is nil after configuration")
    }

    class AlbumViewControllerMock: AlbumViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
