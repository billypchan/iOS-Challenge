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
    
    func testViewErrorUI_expectHUDShows() {
        let viewController = AlbumViewController()
        /** mack output UI */
        let mockCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        mockCollectionView.delegate = viewController
        mockCollectionView.dataSource = viewController
        viewController.collectionView = mockCollectionView
        
        let presenter = MockPresenter()
        presenter.view = viewController
        
        presenter.onError()
        
        
        let expect = expectation(description: "receive urls operation")
        
        let deadlineTime = DispatchTime.now() + .seconds(0)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            let allSubviews = viewController.view.allSubViews
            
            var isHUDfound = false
            allSubviews.forEach { subview in
                if subview.accessibilityIdentifier == "PKHUD" {
                    isHUDfound = true
                }
            }
            XCTAssert(isHUDfound == true, "Retrieved URLs")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 60)
        
    }
    
    func testViewCollectionView_expectCreate2DummyRows() {
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

extension UIView {
    var allSubViews : [UIView] {
        
        var array = [self.subviews].flatMap {$0}
        
        array.forEach { array.append(contentsOf: $0.allSubViews) }
        
        return array
    }
}
