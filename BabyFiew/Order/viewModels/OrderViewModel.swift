//
//  OrderViewModel.swift
//  BabyFiew
//
//  Created by Nghia Tran on 16/04/2023.
//

import Foundation

protocol OrderFetcher {
    func fetchServices() async -> Service
}

class OrderViewModel : ObservableObject {
    @Published var showSelectProducts: Bool = false
    @Published var showCreateCustomer: Bool = false
    @Published var showSearchCustomer: Bool = false
    
    @Published var services = Service()
    
    private let orderServices: OrderFetcher
    
    init(orderServices: OrderFetcher) {
        self.orderServices = orderServices
    }
    
    @MainActor func loadServices() {
        Task {
            services = await orderServices.fetchServices()
        }
    }
}
