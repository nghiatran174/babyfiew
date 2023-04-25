//
//  SearchComponentView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 25/04/2023.
//

import SwiftUI

struct SearchComponentView<Content>: View where Content: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: SearchComponentViewModel
    
    let navLink: (Baby) -> Content
    
    init(viewModel: SearchComponentViewModel,
         @ViewBuilder navLink: @escaping (Baby) -> Content) {
        self.viewModel = viewModel
        self.navLink = navLink
    }
    
    init(viewModel: SearchComponentViewModel) where Content == EmptyView {
        self.init(viewModel: viewModel) {_ in
            EmptyView()
        }
    }
    
    var body: some View {
        List {
            ForEach(viewModel.listResultSearch) { baby in
                if navLink is (Baby)->EmptyView {
                    ResultSearchRow(baby: baby)
                        .onTapGesture {
                            viewModel.selectResultSearch = baby
                            dismiss()
                        }
                } else {
                    NavigationLink {
                        navLink(baby)
                    } label: {
                        ResultSearchRow(baby: baby)
                    }
                }
            }
        }
        //            .listStyle(.plain)
        .onChange(of: viewModel.searchText) { _ in
            viewModel.search()
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Số điện thoại/ tên bố mẹ / tên bé")
    }
}

struct SearchComponentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchComponentView(viewModel: SearchComponentViewModel(searcher: SearcherMock()))
            
        }
        
        NavigationView {
            SearchComponentView(viewModel: SearchComponentViewModel(searcher: SearcherMock())) {baby in
                Text("ahihi \(baby.nickName)")
            }
        }
    }
}
