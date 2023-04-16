//
//  SearchCustomerView.swift
//  BabyFiew
//
//  Created by Nghia Tran on 16/04/2023.
//

import SwiftUI

struct SearchCustomerView: View {
    @ObservedObject var viewModel: OrderViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SearchCustomerView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCustomerView(viewModel: OrderViewModel())
    }
}
