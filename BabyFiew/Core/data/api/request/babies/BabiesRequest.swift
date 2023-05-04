//
//  BabiesRequest.swift
//  BabyFiew
//
//  Created by Nghia Tran on 03/05/2023.
//

import Foundation

enum BabiesRequest: RequestProtocol {
    case addBaby(baby: Baby)
    
    var path: String {
        "/babies"
    }
    
    var requestType: RequestType {
        .POST
    }
    
    var params: [String : Any] {
        switch self {
        case .addBaby(let baby):
            return ["baby": baby]
        }    
    }
}
