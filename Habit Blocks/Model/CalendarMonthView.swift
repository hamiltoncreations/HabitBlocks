//
//  CalendarMonthView.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/18/21.
//

import SwiftUI

struct CalendarMonthView: View {
    var body: some View {
        VStack {
            HStack {
                CalendarDayView(date: 1)
                CalendarDayView(date: 2)
                CalendarDayView(date: 3)
            }
            HStack {
                CalendarDayView(date: 4)
                CalendarDayView(date: 5)
                CalendarDayView(date: 6)
            }
            HStack {
                CalendarDayView(date: 7)
                CalendarDayView(date: 8)
            }
        }
    }
}

struct CalendarMonthView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMonthView()
    }
}
