//
//  Logout.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 26.04.2022.
//

import Alamofire

class Logout: AbstractRequestFactory {
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

extension Logout: LogoutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<BoolRequestResult>) -> Void) {
        let requestModel = LogoutRequest(
            userId: userId,
            baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Logout {
    struct LogoutRequest: RequestRouter {
        let userId: Int
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        var parameters: Parameters? {
            return [
                "id_user": userId
            ]
        }
    }
}
