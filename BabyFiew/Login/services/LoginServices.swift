//
//  LoginServices.swift
//  BabyFiew
//
//  Created by Nghia Tran on 29/04/2023.
//

import Foundation

struct LoginServices: LoginServicesProtocol {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
    
    func login(userName: String, password: String) async -> User? {
        let requestData = AuthTokenRequest.auth(userName: userName, password: password)
        do {
            let userLogin: UserLogin = try await requestManager.perform(requestData)
            
            //store token
            TokenManager().save(token: userLogin.apiToken)
            
            //store logged
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: AppUserDefaultsKeys.logged)
            
            return userLogin.user
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
