//
//  BabiesRequest.swift
//  BabyFiew
//
//  Created by Nghia Tran on 03/05/2023.
//

import Foundation

enum BabiesRequest: RequestProtocol {
    case addBaby(baby: Baby)
    case search(text: String)
    
    var path: String {
        "/api/babies"
    }
    
    var requestType: RequestType {
        switch self {
        case .addBaby(_):
            return .POST
        default:
            return .GET
        }
    }
    
    var params: [String : Any] {
        switch self {
        case .addBaby(let baby):
            return ["baby": baby]
        default:
            return [:]
        }    
    }
    
    var urlParams: [String : String?] {
        switch self {
        case let .search(text):
            return ["search": text]
        default:
            return [:]
        }
    }
}
