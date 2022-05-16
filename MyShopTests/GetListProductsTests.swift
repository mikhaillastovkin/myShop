//
//  GetListProductsTests.swift
//  MyShopTests
//
//  Created by Михаил Ластовкин on 16.05.2022.
//

import XCTest
@testable import MyShop

class GetListProductsTests: XCTestCase {

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

    func testGetListProductsRequestFactoryNotNill() {
        let getListProductsReqestFactory = requestFactory.getProductList()
        XCTAssertNotNil(getListProductsReqestFactory)
    }

    func testGetListProductsRequestResult() {
        let getListProductsReqestFactory = requestFactory.getProductList()
        getListProductsReqestFactory.getProductsList(pageNumber: 1, idCategory: 1) { response in
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
