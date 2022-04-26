//
//  ChangeUserDataRequestFactory.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 26.04.2022.
//

import Alamofire

protocol ChangeUserDataRequestFactory {
    func register(newData: UserData, completionHandler: @escaping
    (AFDataResponse<BoolRequestResult>) -> Void)
}
