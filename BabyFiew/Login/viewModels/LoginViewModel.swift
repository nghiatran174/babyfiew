//
//  LoginViewModel.swift
//  BabyFiew
//
//  Created by Nghia Tran on 29/04/2023.
//

import Foundation

protocol LoginServicesProtocol {
    func login(userName: String, password: String) async -> User?
}

class LoginViewModel: ObservableObject {
    @Published var isLogin: Bool
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var wrongUser: Bool = false

    private let loginServices: LoginServicesProtocol
    
    init(loginServices: LoginServicesProtocol) {
        let userDefaults = UserDefaults.standard
        
        self.loginServices = loginServices
        
        self.isLogin = !userDefaults.bool(forKey: AppUserDefaultsKeys.logged)
    }
    
    @MainActor func login() {
        Task {
            if let _ = await loginServices.login(userName: userName, password: password) {
                self.isLogin = false
            } else {
                self.wrongUser = true
            }
        }
    }
}
