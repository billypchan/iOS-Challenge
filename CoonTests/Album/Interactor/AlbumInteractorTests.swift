//
//  AlbumInteractorTests.swift
//  CoonApp-iOS
//
//  Created by Bill, Chan Yiu Por on 14/09/2017.
//  Copyright © 2017 com.billchan. All rights reserved.
//

import XCTest
@testable import Coon
import OHHTTPStubs

class AlbumInteractorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        OHHTTPStubs.removeAllStubs()
    }
    
    var stubNoConnection: OHHTTPStubsDescriptor?
    
    func testStubLostConnection_expectMockPresenterSetIsErrorFlag() {
        stubNoConnection = stub(condition: isHost("api.flickr.com")) { _ in
            let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
            return OHHTTPStubsResponse(error:notConnectedError)
        }
        stubNoConnection?.name = "no connection stub"
        
        OHHTTPStubs.onStubActivation { (request: URLRequest, stub: OHHTTPStubsDescriptor, response: OHHTTPStubsResponse) in
            print("[OHHTTPStubs] Request to \(request.url!) has been stubbed with \(String(describing: stub.name))")
        }
        
        let presenter = MockPresenter()
        
        let interactor = AlbumInteractor()
        interactor.output = presenter
        
        interactor.retrievePhotos()

        let expect = expectation(description: "operation")
        
        let deadlineTime = DispatchTime.now() + .seconds(10)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            XCTAssert(presenter.isError, "Got Error")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 60)

    }

    func testInteractorRetrievePhotos_expectURLIsRetrived() {
        let presenter = MockPresenter()
        
        let interactor = AlbumInteractor()
        interactor.output = presenter
        
        interactor.retrievePhotos()
        
        let expect = expectation(description: "receive Photos operation")
        
        let deadlineTime = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            XCTAssert(presenter.Photos.count > 0, "Retrieved Photos")
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 60)
    }
}
