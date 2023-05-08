//
//  ServicesRequest.swift
//  BabyFiew
//
//  Created by Nghia Tran on 03/05/2023.
//

import Foundation

enum ServicesRequest: RequestProtocol {
    case getServices
    
    var path: String {
        "/api/services"
    }
    
    var requestType: RequestType  {
        .GET
    }
}
