//
//  AbstractErrorParser.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 26.04.2022.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
