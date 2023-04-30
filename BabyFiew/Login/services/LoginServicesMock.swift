//
//  LoginServicesMock.swift
//  BabyFiew
//
//  Created by Nghia Tran on 29/04/2023.
//

import Foundation

struct LoginServicesMock: LoginServicesProtocol {
    func login(userName: String, password: String) async -> User? {
        guard userName == "admin", password == "admin" else {
            return nil
        }
        
        //store logged
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: AppUserDefaultsKeys.logged)
        
        return User(id: 123, userName: "admin", name: "Admin")
    }
}
