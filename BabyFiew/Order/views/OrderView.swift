//
//  OrderView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 10/04/2023.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var viewModel: OrderViewModel
    @ObservedObject var searchViewModel: SearchComponentViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Text("Tạo đơn")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
            }
            .padding([.bottom], 20)
            
            Divider()
            
            HStack {
                LabelIconView(systemName: "person", backgroundColor: "pinkmain", text: "Khách hàng")
                Spacer()
                
                Button(action: { viewModel.showSearchCustomer.toggle()
                }) {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                }
            }
            
            if let customerSelected = viewModel.customerSelected {
                CustomerRowView(customerModel: customerSelected)
                    .padding(.vertical, 10)
            }

            HStack {
                LabelIconView(systemName: "list.bullet", backgroundColor: "pinkmain", text: "Sản phẩm/dịch vụ")
                Spacer()
                Button(action: { viewModel.showSelectProducts.toggle()}) {
                    Image(systemName: "line.3.horizontal.decrease")
                }
            }
            
            List {
                ForEach(viewModel.services.servicesSelected){ product in
                    VStack(alignment: .leading) {
                        Text(product.name)
                        
                        Text("\(product.price)")
                            .foregroundColor(.green)
                            .font(.subheadline)
                        
                    }
                }
            }
            .listStyle(.plain)

            HStack(alignment: .bottom) {
                Spacer()
                Text("Thành tiền: ")
                Text("\(viewModel.totalBill)")
                    .font(.title2)
                    .bold()
            }
            
            HStack(spacing: 50) {
                Spacer()
                Button(viewModel.saveButtonTitle){
                    viewModel.saveOrder()
                }
                .disabled(viewModel.saveButtonDisabled)
                
                Button("In") {
                    
                }
                .disabled(true)

                Spacer()
            }
            .buttonStyle(NormalButton(width: 80))
            
        }
        .padding(.horizontal)
        .sheet(isPresented: $viewModel.showSelectProducts) {
            SelectProductsView(viewModel: viewModel)
        }
        .sheet(isPresented: $viewModel.showSearchCustomer, onDismiss: {
            if let customerSelected = searchViewModel.selectResultSearch {
                viewModel.customerSelected = customerSelected
            }
        }) {
            SearchCustomerView(viewModel: viewModel, searchViewModel: searchViewModel)
        }
        .onAppear {
            viewModel.loadServices()
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel( orderServices: OrderMock()), searchViewModel: SearchComponentViewModel(searcher: SearcherMock()))
    }
}
