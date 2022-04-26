//
//  AuthRequestFactory.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 26.04.2022.
//

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping
    (AFDataResponse<LoginResult>) -> Void)
}


