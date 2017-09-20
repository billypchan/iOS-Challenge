//
//  CoonUITests.swift
//  CoonUITests
//
//  Created by chan bill on 18/9/2017.
//  Copyright © 2017 CoonAndFriends. All rights reserved.
//

import XCTest

extension XCUIElement {
    func forceTap() {
        if self.isHittable {
            self.tap()
        } else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: .zero)
            coordinate.tap()
        }
    }
}

class CoonUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFullScreen_expectTheFullScreenImageShowsAndDismisses(){
        let app = XCUIApplication()
        let firstCell = XCUIApplication().cells.element(boundBy: 0)

        if firstCell.waitForExistence(timeout: 10) {
           firstCell.images.element(boundBy: 0).forceTap()
        }
        
        let label = app.images["FullScreenImage"]
        let exists = NSPredicate(format: "exists == 1")
        
        expectation(for: exists, evaluatedWith: label, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLoadView_expectNumberOfCellMoreThenOne() {
        let firstCell = XCUIApplication().cells.element(boundBy: 0)
        
        var originalCount = 0
        if firstCell.waitForExistence(timeout: 10) {
            originalCount = Int(XCUIApplication().cells.count)
        }
        
        XCTAssertTrue(originalCount > 0, "loaded some cells")
    }

}
