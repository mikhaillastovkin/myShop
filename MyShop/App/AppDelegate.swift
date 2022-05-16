//
//  AppDelegate.swift
//  MyShop
//
//  Created by Михаил Ластовкин on 25.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //MARK: - Auth
        let auth = requestFactory.makeAuthRequestFatory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        //MARK: - Regist new user
        let register = requestFactory.registerNewUser()
        let newUser = UserData(
            id: 123,
            username: "Somebody",
            password: "mypassword",
            email: "some@some.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language")
        register.register(newUser: newUser) { response in
            switch response.result {
            case .success(let resultMessage):
                print(resultMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        //MARK: - Logout
        let logout = requestFactory.logout()
        logout.logout(userId: 123) { response in
            switch response.result {
            case .success(let resultMessage):
                print("\(logout.self) \(resultMessage)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        //MARK: - Change user data
        let changeData = requestFactory.changeUserData()
        let newData = UserData(
            id: 123,
            username: "Somebody",
            password: "mypassword",
            email: "some@some.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language")
        changeData.register(newData: newData) { response in
            switch response.result {
            case .success(let resultMessage):
                print("\(changeData.self) \(resultMessage)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        //MARK: - Get products list
        let getProductList = requestFactory.getProductList()
        getProductList.getProductsList(pageNumber: 1, idCategory: 1) { response in
            switch response.result {
            case .success(let resultMessage):
                print("\(getProductList.self) \(resultMessage)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
