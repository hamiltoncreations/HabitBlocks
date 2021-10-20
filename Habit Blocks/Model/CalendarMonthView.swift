//
//  CalendarMonthView.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/18/21.
//

import SwiftUI

struct CalendarMonthView: View {
    
    var name: String
    var numberOfDays: Int
    var dates: [CalendarDayView]!
    
    var body: some View {
        VStack(spacing:0) {
            HStack(spacing:0) {
                CalendarWeekDaysTitleView(weekDayTitle: "Sun")
                CalendarWeekDaysTitleView(weekDayTitle: "Mon")
                CalendarWeekDaysTitleView(weekDayTitle: "Tue")
                CalendarWeekDaysTitleView(weekDayTitle: "Wed")
                CalendarWeekDaysTitleView(weekDayTitle: "Thu")
                CalendarWeekDaysTitleView(weekDayTitle: "Fri")
                CalendarWeekDaysTitleView(weekDayTitle: "Sat")
            }
            
            HStack(spacing:0) {
                CalendarDayView(date: 1)
                CalendarDayView(date: 2)
                CalendarDayView(date: 3)
                CalendarDayView(date: 4)
                CalendarDayView(date: 5)
                CalendarDayView(date: 6)
                CalendarDayView(date: 7)
            }.frame(maxWidth:.infinity)
            HStack(spacing:0) {
                CalendarDayView(date: 8)
                CalendarDayView(date: 9)
                CalendarDayView(date: 10)
                CalendarDayView(date: 11)
                CalendarDayView(date: 12)
                CalendarDayView(date: 13)
                CalendarDayView(date: 14)
            }.frame(maxWidth:.infinity)
            HStack(spacing:0) {
                CalendarDayView(date: 15)
                CalendarDayView(date: 16)
                CalendarDayView(date: 17)
                CalendarDayView(date: 18)
                CalendarDayView(date: 19)
                CalendarDayView(date: 20)
                CalendarDayView(date: 21)
            }.frame(maxWidth:.infinity)
        }
    }
    
    func buildDates() {
        
    }
}

struct CalendarMonthView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMonthView(name: "Spooktober", numberOfDays: 31)
    }
}
