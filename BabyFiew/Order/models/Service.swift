//
//  Service.swift
//  BabyFiew
//
//  Created by Nghia Tran on 20/04/2023.
//

import Foundation

struct Service {
    var lstProduct: [Product]
    var lstServicePack: [Product]
    var lstServiceRetail: [Product]
    var lstGift: [Product]
    
    var servicesSelected: [Product] {
        let products = lstProduct.filter { product in
            product.isOn
        }
        let servicePacks = lstServicePack.filter { product in
            product.isOn
        }
        let serviceRetail = lstServiceRetail.filter { product in
            product.isOn
        }
        let gift = lstGift.filter { product in
            product.isOn
        }
        return products + servicePacks + serviceRetail + gift
    }
}

extension Service {
    init() {
        self.lstProduct = []
        self.lstServicePack = []
        self.lstServiceRetail = []
        self.lstGift = []
    }
}
