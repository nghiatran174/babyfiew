//
//  SearcherMock.swift
//  BabyFiew
//
//  Created by Nghia Tran on 18/04/2023.
//

import Foundation

struct SearcherMock: Searcher {
    func searchBaby(by text: String) async -> [Baby] {
        let customer = Customer(id: 1, name: "Ten bo me", phone: "098765433", gender: .female)
        return [
            Baby(id: 1, name: "Ho va ten 01", nickName: "Mia 01", parent: customer, gender: .male),
            Baby(id: 2, name: "Ho va ten 02", nickName: "Mia 02", parent: customer, gender: .male),
            Baby(id: 3, name: "Ho va ten 03", nickName: "Mia 03", parent: customer, gender: .male),
            Baby(id: 4, name: "Ho va ten 04", nickName: "Mia 04", parent: customer, gender: .male)
        ]
    }
}
