//
//  SearchCustomerView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 16/04/2023.
//

import SwiftUI

struct SearchCustomerView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: OrderViewModel
    @ObservedObject var searchViewModel: SearchComponentViewModel
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
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
            
            VStack(alignment: .trailing) {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.showCreateCustomer.toggle()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .scaledToFit()
                            .padding()
                            .foregroundColor(Color("pinkmain"))
                            .background(Color("bluemain"))
                            .clipShape(Circle())
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $viewModel.showCreateCustomer, onDismiss: {
            if let _ = viewModel.newBaby.id {
                searchViewModel.selectResultSearch = viewModel.newBaby
                dismiss()
            }
        }) {
            CreateCustomerView(viewModel: viewModel)
        }
    }
}

struct SearchCustomerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCustomerView(viewModel: OrderViewModel( orderServices: OrderMock()), searchViewModel: SearchComponentViewModel(searcher: SearcherMock()))
    }
}
