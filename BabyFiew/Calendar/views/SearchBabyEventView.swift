//
//  SearchBabyEventView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 24/04/2023.
//

import SwiftUI

struct SearchBabyEventView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var searchViewModel: SearchComponentViewModel
    
    var body: some View {
        NavigationView {
            SearchComponentView(viewModel: searchViewModel)
            .toolbar {
                ToolbarItem {
                    Button("Hủy"){
                        dismiss()
                    }
                }
            }
        }
    }
}

struct SearchBabyEventView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBabyEventView(searchViewModel: SearchComponentViewModel(searcher: SearcherMock()))
    }
}
