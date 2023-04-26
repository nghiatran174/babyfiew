//
//  HomeViewModel.swift
//  BabyFiew
//
//  Created by Nghia Tran on 06/04/2023.
//

import Foundation

class CalendarViewModel : ObservableObject {
    @Published var showEventView: Bool
    
    @Published var eventDate: Date
    @Published var eventBabyName: String
    @Published var eventNote: String
    
    @Published var showSearch: Bool
    
    init() {
        showEventView = false
        
        eventDate = Date()
        eventBabyName = ""
        eventNote = "Ghi chú"
        
        showSearch = false
    }
    
    func addEvent() {
        
    }
}
