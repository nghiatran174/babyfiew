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

@MainActor
class OrderViewModel : ObservableObject {
    @Published var showSelectProducts: Bool = false
    @Published var showCreateCustomer: Bool = false
    
    @Published var showSearchCustomer: Bool = false
    @Published var searchText = ""
    @Published var resultSearchCustomers: [Baby] = []
    @Published var selectSearchCustomer: Baby?
    
    @Published var services = Service()
    
    private let customerSearcher: Searcher
    private let orderServices: OrderFetcher
    
    init(customerSearcher: Searcher, orderServices: OrderFetcher) {
        self.customerSearcher = customerSearcher
        self.orderServices = orderServices
    }
    
    func search() {
        Task {
            resultSearchCustomers = await customerSearcher.searchBaby(by: "")
        }
    }
    
    func loadServices() {
        Task {
            services = await orderServices.fetchServices()
        }
    }
}
