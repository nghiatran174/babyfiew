//
//  CalendarServicesMock.swift
//  BabyFiew
//
//  Created by Nghia Tran on 30/04/2023.
//

import Foundation

struct CalendarServicesMock: CalendarServicesProtocol {
    func fetchEvents() async -> [Event] {
        [Event(date: Date(), baby: Baby.mock.first!, note: "Note"),
         Event(date: Date(), baby: Baby.mock.first!, note: "Note2"),
         Event(date: Date(), baby: Baby.mock.first!, note: "Note3")
        ]
    }
    
    func addEvent(event: Event) -> Bool {
        false
    }
}
