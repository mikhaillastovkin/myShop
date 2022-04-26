//
//  Register.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 26.04.2022.
//

import Alamofire

class Register: AbstractRequestFactory {
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

extension Register: RegisterRequestFactory {

    func register(newUser: UserData, completionHandler: @escaping (AFDataResponse<RegisterUserResult>) -> Void) {
        let requestModel = NewUserRequest(
            newUser: newUser,
            baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Register {
    struct NewUserRequest: RequestRouter {
        let newUser: UserData
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        var parameters: Parameters? {
            return [
                "id_user": newUser.id,
                "username": newUser.username,
                "password": newUser.password,
                "email": newUser.email,
                "gender": newUser.gender,
                "credit_card": newUser.creditCard,
                "bio": newUser.bio
            ]
        }
    }
}
