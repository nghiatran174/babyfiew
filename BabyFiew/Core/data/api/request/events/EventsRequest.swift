//
//  EventsRequest.swift
//  BabyFiew
//
//  Created by Nghia Tran on 03/05/2023.
//

import Foundation

enum EventsRequest: RequestProtocol {
    case getEvents
    case addEvent(_ event: Event)
    
    var path: String {
        "/events"
    }
    
    var params: [String : Any] {
        switch self {
        case .getEvents:
            return [:]
        case .addEvent(let event):
            return ["idbaby": event.baby.id!,
                    "date": event.date,
                    "note": event.note]
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .getEvents:
            return .GET
        case .addEvent(_):
            return .POST
        }
    }
}
