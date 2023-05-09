//
//  OrderServices.swift
//  BabyFiew
//
//  Created by Nghia Tran on 20/04/2023.
//

import Foundation

struct OrderServices: OrderFetcher {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
    
    func fetchServices() async throws -> Service {
        let requestData = ServicesRequest.getServices
        let service: Service = try await requestManager.perform(requestData)
        return service
    }
    
    func addCustomer(baby: Baby) async throws -> Baby {
        let requestData = BabiesRequest.addBaby(baby: baby)
        let baby: Baby = try await requestManager.perform(requestData)
        return baby
    }
    
    func saveOrder(customer: Customer, services: [Product], totalBill: Double) async throws -> Int {
        let requestData = OrdersRequest.addOrder(idCustomer: customer.id!, services: services, totalBill: totalBill)
        let idOrder: Int = try await requestManager.perform(requestData)
        return idOrder
    }
}
