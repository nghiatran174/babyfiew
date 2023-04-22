//
//  OrderMock.swift
//  BabyFiew
//
//  Created by Nghia Tran on 20/04/2023.
//

import Foundation

struct OrderMock: OrderFetcher {
    func fetchServices() async -> Service {
        Service(
            lstProduct: [
                Product(id: 123, name: "San pham", price: 123, type: .product, quantityProcess: 1, isOn: false),
                Product(id: 124, name: "San pham", price: 123, type: .product, quantityProcess: 1, isOn: false),
                Product(id: 125, name: "San pham", price: 123, type: .product, quantityProcess: 1, isOn: false)
            ],
            lstServicePack: [
                Product(id: 126, name: "San pham", price: 123, type: .servicePack, quantityProcess: 1, isOn: false),
                Product(id: 127, name: "San pham", price: 123, type: .servicePack, quantityProcess: 1, isOn: false),
                Product(id: 128, name: "San pham", price: 123, type: .servicePack, quantityProcess: 1, isOn: false)],
            lstServiceRetail: [
                Product(id: 129, name: "San pham", price: 123, type: .serviceRetail, quantityProcess: 1, isOn: false),
                Product(id: 130, name: "San pham", price: 123, type: .serviceRetail, quantityProcess: 1, isOn: false),
                Product(id: 131, name: "San pham", price: 123, type: .serviceRetail, quantityProcess: 1, isOn: false)],
            lstGift: [
                Product(id: 132, name: "San pham", price: 123, type: .gift, quantityProcess: 1, isOn: false),
                Product(id: 133, name: "San pham", price: 123, type: .gift, quantityProcess: 1, isOn: false),
                Product(id: 134, name: "San pham", price: 123, type: .gift, quantityProcess: 1, isOn: false)])
    }
}
