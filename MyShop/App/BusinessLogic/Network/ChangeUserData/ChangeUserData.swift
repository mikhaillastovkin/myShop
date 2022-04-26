//
//  ChangeUserData.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 26.04.2022.
//

import Alamofire

class ChangeUserData: AbstractRequestFactory {
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

extension ChangeUserData: ChangeUserDataRequestFactory {

    func register(newData: UserData, completionHandler: @escaping (AFDataResponse<BoolRequestResult>) -> Void) {
        let requestModel = NewUserDataRequest(
            newData: newData,
            baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
        }
}

extension ChangeUserData {
    struct NewUserDataRequest: RequestRouter {
        let newData: UserData
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        var parameters: Parameters? {
            return [
                "id_user": newData.id,
                "username": newData.username,
                "password": newData.password,
                "email": newData.email,
                "gender": newData.gender,
                "credit_card": newData.creditCard,
                "bio": newData.bio
            ]
        }
    }
}
