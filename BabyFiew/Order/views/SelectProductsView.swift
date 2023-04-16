//
//  SelectProductsView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 16/04/2023.
//

import SwiftUI

struct SelectProductsView: View {
    @ObservedObject var viewModel: OrderViewModel
//    @Binding var listSelect:[Bool]
    @State var isChecked = false
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("DV goi")) {
                    Toggle(isOn: $isChecked) {
                        Text("Test checkbox")
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    
                    Toggle(isOn: $isChecked) {
                        Text("Test checkbox")
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    
                    Toggle(isOn: $isChecked) {
                        Text("Test checkbox")
                    }
                    .toggleStyle(CheckboxToggleStyle())
                }
                
                Section(header: Text("DV goi")) {
                    Toggle(isOn: $isChecked) {
                        Text("Test checkbox")
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    
                    Toggle(isOn: $isChecked) {
                        Text("Test checkbox")
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    
                    Toggle(isOn: $isChecked) {
                        Text("Test checkbox")
                    }
                    .toggleStyle(CheckboxToggleStyle())
                }
            }
            
            Button(action: {
                viewModel.showSelectProducts = false
            }) {
                Text("OK")
            }
            .buttonStyle(NormalButton(width: 80))
        }
    }
}

struct SelectProductsView_Previews: PreviewProvider {
    static var previews: some View {
        SelectProductsView(viewModel: OrderViewModel())
    }
}
