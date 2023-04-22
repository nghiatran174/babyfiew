//
//  SearchView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 10/04/2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.babies) { baby in
                    NavigationLink {
                        
                    } label: {
                        ResultSearchRow(baby: baby)
                    }
                }
            }
//            .listStyle(.plain)
            .onChange(of: viewModel.searchText) { _ in
                viewModel.search()
            }
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Số điện thoại/ tên bố mẹ / tên bé")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel(babySearcher: SearcherMock()))
    }
}
