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
    var dateOfBirth: Date?
    let parent: Customer
    var gender: Gender
    var avatar: String?
}

extension Baby {
    init() {
        id = 123
        name = "Ten day du"
        nickName = "nickname"
        parent = Customer()
        gender = .male
    }
}

extension Baby: Identifiable {
}
