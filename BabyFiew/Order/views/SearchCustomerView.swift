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
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            NavigationView {
                List {
                    ForEach(viewModel.resultSearchCustomers) { baby in
                        ResultSearchRow(baby: baby)
                            .onTapGesture {
                                viewModel.selectSearchCustomer = baby
                                dismiss()
                            }
                    }
                }
                //            .listStyle(.plain)
                .onChange(of: viewModel.searchText) { _ in
                    viewModel.search()
                }
                .toolbar {
                    ToolbarItem {
                        Button("Hủy"){
                            dismiss()
                        }
                    }
                }
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Số điện thoại/ tên bố mẹ / tên bé")
            
            
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
        .sheet(isPresented: $viewModel.showCreateCustomer) {
            CreateCustomerView(showView: $viewModel.showCreateCustomer)
        }
    }
}

struct SearchCustomerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCustomerView(viewModel: OrderViewModel(customerSearcher: SearcherMock(), orderServices: OrderMock()))
    }
}
