//
//  OrderViewModel.swift
//  BabyFiew
//
//  Created by Nghia Tran on 16/04/2023.
//

import Foundation

class OrderViewModel : ObservableObject {
    @Published var showSelectProducts: Bool
    @Published var showSearchCustomer: Bool
    
    init(){
        self.showSelectProducts = false
        self.showSearchCustomer = false
    }
}
