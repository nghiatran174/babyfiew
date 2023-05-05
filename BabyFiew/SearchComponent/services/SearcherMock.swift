//
//  SearcherMock.swift
//  BabyFiew
//
//  Created by Nghia Tran on 18/04/2023.
//

import Foundation

struct SearcherMock: Searcher {
    func searchBaby(by text: String) async -> [Baby] {
        Baby.mock.filter { baby in
            baby.name.contains(text) ||
            baby.nickName.contains(text) ||
            baby.parent.name.contains(text) ||
            baby.parent.phone.contains(text)
        }
    }
}
