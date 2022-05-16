//
//  ProductListResult.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 16.05.2022.
//

import Foundation

struct ProductListResult: Codable {
    let idProduct: Int
    let productName: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price = "price"
    }
}
