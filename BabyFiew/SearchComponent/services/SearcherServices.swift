//
//  Searcher.swift
//  BabyFiew
//
//  Created by Nghia Tran on 05/05/2023.
//

import Foundation

struct SearcherServices: Searcher {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
    
    func searchBaby(by text: String) async throws -> [Baby] {
        let requestData = BabiesRequest.search(text: text)
        let babies: [Baby] = try await requestManager.perform(requestData)
        return babies
    }    
}
