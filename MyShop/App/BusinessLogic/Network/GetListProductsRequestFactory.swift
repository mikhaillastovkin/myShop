//
//  GetListProductsRequestFactory.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 16.05.2022.
//

import Alamofire

protocol GetListProductsRequestFactory {
    func getProductsList(pageNumber: Int, idCategory: Int, completionHandler: @escaping
    (AFDataResponse<[ProductListResult]>) -> Void)
}
