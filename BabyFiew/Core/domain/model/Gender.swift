//
//  Gender.swift
//  BabyFiew
//
//  Created by Nghia Tran on 18/04/2023.
//

import Foundation

enum Gender: String, Codable, CaseIterable {
    case female
    case male
    
    var displayText: String {
        switch self {
        case .female:
            return "Nữ"
        case .male:
            return "Nam"
        }
    }
}
