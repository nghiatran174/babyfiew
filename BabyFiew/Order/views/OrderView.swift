//
//  OrderView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 10/04/2023.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var viewModel: OrderViewModel
    
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
            
            if let selectSearchCustomer = viewModel.selectSearchCustomer {
                CustomerRowView(customerModel: selectSearchCustomer)
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
                Text("2.580.000")
                    .font(.title2)
                    .bold()
            }
            
            HStack(spacing: 50) {
                Spacer()
                Button("Lưu"){
                    
                }
                
                Button("In") {
                    
                }
                Spacer()
            }
            .buttonStyle(NormalButton(width: 80))
            
        }
        .padding(.horizontal)
        .sheet(isPresented: $viewModel.showSelectProducts) {
            SelectProductsView(viewModel: viewModel)
        }
        .sheet(isPresented: $viewModel.showSearchCustomer) {
            SearchCustomerView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.loadServices()
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(customerSearcher: SearcherMock(), orderServices: OrderMock()))
    }
}
