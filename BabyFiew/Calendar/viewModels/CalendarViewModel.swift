//
//  HomeViewModel.swift
//  BabyFiew
//
//  Created by Nghia Tran on 06/04/2023.
//

import Foundation
import SwiftUI

protocol CalendarServicesProtocol {
    func fetchEvents() async throws -> [Event]
    func addEvent(event: Event) async throws -> Bool
}

@MainActor
class CalendarViewModel : ObservableObject {
    @Published var showEventView: Bool = false
    @Published var newEvent: Event
    @Published var showSearch: Bool = false
    @Published var messageAlert: String = ""
    @Published var showAlert: Bool = false
    @Published var selectDay: Int
    @Published var eventsOfSelectDay: [Event] = []
    
    let backgroundColorEvents = [Color.green, Color.pink, Color.blue, Color.yellow]
    var days: [Weekday] = []

    private var allEvents: [Event] = []
    private let calendarServices: CalendarServicesProtocol
    
    init(calendarServices: CalendarServicesProtocol) {
        self.calendarServices = calendarServices
        
        newEvent = Event(date: Date(), baby: Baby(), note: "")
        
        var day = Date()
        
        selectDay = Calendar.current.component(.day, from: day)
        
        //init days
        for _ in 1...7 {
            let weekdayDigit = Calendar.current.component(.weekday, from: day);
            let weekdayString = weekdayDigit == 1 ? "CN" : "T\(weekdayDigit)"
            let weekday = Weekday(weekday: weekdayString, day: Calendar.current.component(.day, from: day))
            days.append(weekday)
            day = Calendar.current.date(byAdding: .day, value: 1, to: day) ?? day
        }
    }
    
    func fetchEvents() async {
        do {
            allEvents = try await calendarServices.fetchEvents()
        } catch {
            allEvents = []
        }
        
        filterEvents()        
    }
    
    func filterEvents() {
        eventsOfSelectDay = allEvents.filter {
            Calendar.current.component(.day, from: $0.date) == selectDay
        }
    }
    
    private func isNewEventValid() -> Bool {
        if let _ = newEvent.baby.id,
           newEvent.date.compare(Date()) == .orderedDescending {
            return true
        }
        return false
    }
    
    func addEvent() {
        guard isNewEventValid() else {
            messageAlert = "Chưa đủ thông tin"
            showAlert.toggle()
            return
        }
        
        Task {
            do {
                let result = try await calendarServices.addEvent(event: newEvent)
                if result {
                    await fetchEvents()
                    showEventView.toggle()
                } else {
                    messageAlert = "Chưa thêm được lịch"
                    showAlert.toggle()
                }
            } catch {
                messageAlert = "Lỗi mạng"
                showAlert.toggle()
            }
        }
    }
}
