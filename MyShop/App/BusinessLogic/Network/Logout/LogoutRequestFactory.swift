//
//  LogoutRequestFactory.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 26.04.2022.
//

import Alamofire

protocol LogoutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping
    (AFDataResponse<BoolRequestResult>) -> Void)
}
