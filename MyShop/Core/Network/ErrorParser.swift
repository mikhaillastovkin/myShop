//
//  ErrorParser.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 26.04.2022.
//

import Foundation

final class ErrorParser: AbstractErrorParser {

    func parse(_ result: Error) -> Error {
        return result }

    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error }
}
