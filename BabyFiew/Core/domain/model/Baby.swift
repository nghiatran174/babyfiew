//
//  Baby.swift
//  BabyFiew
//
//  Created by Nghia Tran on 18/04/2023.
//

import Foundation

struct Baby: Codable {
    var id: Int?
    var name: String
    var nickName: String
    var dateOfBirth: Date
    var parent: Customer
    var gender: Gender
    var avatar: String?
}

extension Baby {
    init() {
        name = ""
        nickName = ""
        dateOfBirth = Date()
        parent = Customer()
        gender = .male
    }
}

extension Baby: Identifiable {
}
