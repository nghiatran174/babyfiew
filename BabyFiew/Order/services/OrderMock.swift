//
//  OrderMock.swift
//  BabyFiew
//
//  Created by Nghia Tran on 20/04/2023.
//

import Foundation

struct OrderMock: OrderFetcher {
    func addCustomer(baby: Baby) async throws -> Baby {
        var newBaby = baby
        newBaby.id = 1111
        newBaby.parent.id = 2222
        return newBaby
    }
    
    func fetchServices() async -> Service {
        Service.mock
    }
    
    func saveOrder(customer: Customer, services: [Product], totalBill: Double) async throws -> Int {
        100
    }
}
