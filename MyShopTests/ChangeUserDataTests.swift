//
//  ChangeUserDataTests.swift
//  MyShopTests
//
//  Created by Михаил Ластовкин on 17.05.2022.
//

import XCTest
@testable import MyShop

class ChangeUserDataTests: XCTestCase {

    let expectation = XCTestExpectation(description: "request")
    var requestFactory: RequestFactory!

    override func setUp()  {
        super.setUp()
        self.requestFactory = RequestFactory()
    }

    override func tearDown() {
        self.requestFactory = nil
        super.tearDown()
    }

    func testChangeUserDataRequestFactoryNotNill() {
        let changeUserData = requestFactory.changeUserData()
        XCTAssertNotNil(changeUserData)
    }

    func testChangeUserDataRequest() {
        let newData = UserData(id: 1, username: "foo", password: "baz", email: "box", gender: "male", creditCard: "big", bio: "vag")
        let changeUserDataRequestFactory = requestFactory.changeUserData()
        changeUserDataRequestFactory.register(newData: newData) { response in
            switch response.result {
            case .success(_):
                break
            case .failure(_):
                XCTFail()
            }
        }
        self.expectation.fulfill()
    }
}
