//
//  OrdersRequest.swift
//  BabyFiew
//
//  Created by Nghia Tran on 05/05/2023.
//

import Foundation

enum OrdersRequest: RequestProtocol {
    case addOrder(idCustomer: Int, services: [Product], totalBill: Double)
    
    var path: String {
        "/api/orders"
    }
    
    var requestType: RequestType {
        .POST
    }
    
    var params: [String : Any] {
        switch self {
        case let .addOrder(idCustomer, services, totalBill):
            return ["idCustomer": idCustomer,
                    "servives": services,
                    "totalBill": totalBill
            ]
        }
    }
}
