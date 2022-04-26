//
//  RegisterRequestFactory.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 26.04.2022.
//

import Alamofire

protocol RegisterRequestFactory {
    func register(newUser: UserData, completionHandler: @escaping
    (AFDataResponse<RegisterUserResult>) -> Void)
}
