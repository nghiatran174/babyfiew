//
//  Searcher.swift
//  BabyFiew
//
//  Created by Nghia Tran on 19/04/2023.
//

import Foundation

protocol Searcher {
    func searchBaby(by text: String) async -> [Baby]
}
