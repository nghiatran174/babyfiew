//
//  SearchComponentViewModel.swift
//  BabyFiew
//
//  Created by Nghia Tran on 25/04/2023.
//

import Foundation

class SearchComponentViewModel : ObservableObject {
    @Published var searchText = ""
    @Published var listResultSearch: [Baby] = []
    @Published var selectResultSearch: Baby?
    
    private let searcher: Searcher
    
    init(searcher: Searcher) {
        self.searcher = searcher
    }
    
    @MainActor func search() {
        Task {
            listResultSearch = await searcher.searchBaby(by: "")
        }
    }
}
