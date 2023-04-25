//
//  SearchView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 10/04/2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    @ObservedObject var searchViewModel: SearchComponentViewModel
    
    var body: some View {
        NavigationView {
            SearchComponentView(viewModel: searchViewModel) { baby in
                Text("Hello \(baby.nickName)")
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(), searchViewModel: SearchComponentViewModel(searcher: SearcherMock()))
    }
}
