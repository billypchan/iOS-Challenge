//
//  AlbumViewTests.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import XCTest
@testable import Coon
import UIKit

class AlbumViewTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }    

    func testView_expectCreate2DummyRows() {
        let viewController = AlbumViewController()
        
        let presenter = MockPresenter()
        presenter.view = viewController
        
        let interactor = MockInteractor()
        interactor.output = presenter
        
        presenter.interactor = interactor
        viewController.output = presenter
        
        /** mack output UI */
        let mockCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        mockCollectionView.delegate = viewController
        mockCollectionView.dataSource = viewController
        viewController.collectionView = mockCollectionView
        
        viewController.viewDidLoad()
        
        
        /** check current rate label is filled, table cell has contents */
        let count = viewController.collectionView?.numberOfItems(inSection: 0)
        
        /** In MockInteractor, it created 2 dummy items, expect would display in the view. */
            XCTAssert(count == 2, "got 2 dummy item rows")
    }

}
