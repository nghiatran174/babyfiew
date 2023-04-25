//
//  SelectProductsView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 16/04/2023.
//

import SwiftUI

struct SelectProductsView: View {
    @ObservedObject var viewModel: OrderViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Dịch vụ gói")) {
                    ForEach(viewModel.services.lstServicePack.indexed(), id: \.1.id) {index, product in
                        Toggle(isOn: self.$viewModel.services.lstServicePack[index].isOn) {
                            Text(product.name)
                        }
                    }
                }
                
                Section(header: Text("Dịch vụ lẻ")) {
                    ForEach(viewModel.services.lstServiceRetail.indexed(), id: \.1.id) {index, product in
                        Toggle(isOn: self.$viewModel.services.lstServiceRetail[index].isOn) {
                            Text(product.name)
                        }
                    }
                }
                
                Section(header: Text("Sản phẩm")) {
                    ForEach(viewModel.services.lstProduct.indexed(), id: \.1.id) {index, product in
                        Toggle(isOn: self.$viewModel.services.lstProduct[index].isOn) {
                            Text(product.name)
                        }
                    }
                }
                
                Section(header: Text("Quà tặng")) {
                    ForEach(viewModel.services.lstGift.indexed(), id: \.1.id) {index, product in
                        Toggle(isOn: self.$viewModel.services.lstGift[index].isOn) {
                            Text(product.name)
                        }
                    }
                }
            }
            .listStyle(.sidebar)
            .toggleStyle(CheckboxToggleStyle())
            .toolbar {
                ToolbarItem {
                    Button("OK") {
                        viewModel.showSelectProducts = false
                    }
                }
            }
        }
    }
}

struct SelectProductsView_Previews: PreviewProvider {
    static var previews: some View {
        SelectProductsView(viewModel: OrderViewModel( orderServices: OrderMock()))
    }
}
