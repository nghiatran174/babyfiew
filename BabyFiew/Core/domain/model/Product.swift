//
//  Product.swift
//  BabyFiew
//
//  Created by Nghia Tran on 20/04/2023.
//

import Foundation

struct Product: Codable, Identifiable {
    var id: Int?
    var name: String
    var price: Double
    var type: ProductType
    var quantityProcess: Int
    var isOn = false
}
