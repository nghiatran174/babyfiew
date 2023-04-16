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
        VStack(alignment: .leading) {
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
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Bố/mẹ: Oanh Kieu")
                
                Text("Bé: ")
                
            }
            .padding(.vertical, 10)

            HStack {
                LabelIconView(systemName: "list.bullet", backgroundColor: "pinkmain", text: "Sản phẩm/dịch vụ")
                Spacer()
                Button(action: { viewModel.showSelectProducts.toggle()}) {
                    Image(systemName: "line.3.horizontal.decrease")
                }
            }
            
            List {
                VStack(alignment: .leading) {
                    Text("Gói bơi hồ nhỏ 10 buổi")

                    Text("2.580.000")
                        .foregroundColor(.green)
                        .font(.subheadline)
                    
                }
                VStack(alignment: .leading) {
                    Text("Gói bơi hồ nhỏ 10 buổi")
                        
                    Text("2.580.000")
                        .foregroundColor(.green)
                        .font(.subheadline)
                    
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
        .padding()
        .sheet(isPresented: $viewModel.showSelectProducts) {
            SelectProductsView(viewModel: viewModel)
        }
        .sheet(isPresented: $viewModel.showSearchCustomer) {
            SearchCustomerView(viewModel: viewModel)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel())
    }
}
