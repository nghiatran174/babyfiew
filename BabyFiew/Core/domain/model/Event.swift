//
//  Event.swift
//  BabyFiew
//
//  Created by Nghia Tran on 24/04/2023.
//

import Foundation

struct Event: Codable {
    var date: Date
    var baby: Baby
    var note: String
}

extension Event {
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}
