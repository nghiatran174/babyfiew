//
//  Customer.swift
//  BabyFiew
//
//  Created by Nghia Tran on 18/04/2023.
//

import Foundation

struct Customer: Codable {
    var id: Int?
    var name: String
    var phone: String
    var gender: Gender
}

extension Customer {
    init() {
        id = 123
        name = "Ten be me"
        phone = "123123123"
        gender = .female
    }
}
