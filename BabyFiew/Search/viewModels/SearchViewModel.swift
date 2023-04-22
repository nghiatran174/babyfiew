//
//  SearchViewModel.swift
//  BabyFiew
//
//  Created by Nghia Tran on 18/04/2023.
//

import Foundation


class SearchViewModel : ObservableObject {
    @Published var searchText = ""
    @Published var babies: [Baby] = []
    
    private let babySearcher: Searcher
    
    init(babySearcher: Searcher) {
        self.babySearcher = babySearcher
    }
    
    @MainActor func search() {
        Task {
            babies = await babySearcher.searchBaby(by: "")
        }
    }
}
