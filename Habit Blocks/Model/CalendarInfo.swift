//
//  CalendarInfo.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/24/21.
//

import Foundation

class CalendarInfo: ObservableObject {
    
    @Published var month: Int
    @Published var year: Int
    
    init() {
        let calendar = Calendar.current
        year = calendar.component(.year, from: Date())
        month = calendar.component(.month, from: Date())
    }
    
    func increaseMonth() {
        month += 1
        
        if month > 12 {
            month = 1
            year += 1
        }
    }
    
    func decreaseMonth() {
        month -= 1
        
        if month < 1 {
            month = 12
            year -= 1
        }
    }
}
