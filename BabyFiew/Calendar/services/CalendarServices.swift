//
//  CalendarServices.swift
//  BabyFiew
//
//  Created by Nghia Tran on 03/05/2023.
//

import Foundation

struct CalendarServices: CalendarServicesProtocol {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
    
    func fetchEvents() async throws -> [Event] {
        let requestData = EventsRequest.getEvents
        let events: [Event] = try await requestManager.perform(requestData)
        return events
    }
    
    func addEvent(event: Event) async throws -> Bool {
        let requestData = EventsRequest.addEvent(event)
        let result: Bool = try await requestManager.perform(requestData)
        return result
    }
}
