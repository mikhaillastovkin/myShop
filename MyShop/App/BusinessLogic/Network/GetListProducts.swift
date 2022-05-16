//
//  GetListProducts.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 16.05.2022.
//

import Alamofire

class GetListProducts: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension GetListProducts: GetListProductsRequestFactory {
    func getProductsList(pageNumber: Int, idCategory: Int, completionHandler: @escaping (AFDataResponse<[ProductListResult]>) -> Void) {
        let requestModel = ProductList(
            baseUrl: baseUrl,
            pageNumber: pageNumber,
            idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetListProducts {
    struct ProductList: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            return ["page_number": pageNumber, "id_category": idCategory]
        }
    }
}
