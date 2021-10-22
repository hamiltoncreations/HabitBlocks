//
//  CalendarMonthView.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/18/21.
//

import SwiftUI

struct CalendarMonthView: View {
    
    var name: String
    var year: Int
    var month: Int
    var numberOfDays: Int
    @State var dates: [DateInfo]!
    
    var body: some View {
        VStack(spacing:0) {
            
            DayOfWeekTitlesView()
            
            if let dates = dates {
                ForEach((0...dates.count/7), id: \.self) {weekNum in
                    HStack(spacing: 0) {
                        
                        let remainingDaysInWeek: Int = (dates.count - (weekNum+1)*7 > 0 ? 7 :dates.count % 7)
                        
                        ForEach((0..<remainingDaysInWeek), id: \.self) { itr in
                            
                            if let dateBlock = dates[itr + (weekNum * 7)] {
                                CalendarDayView(date:dateBlock.day)
                            }
                        }
                    }.frame(maxWidth:.infinity)
                }
            }
        }
        .onAppear {
            buildDates()
        }
    }
    
    func buildDates() {
        dates = []
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = 1
        
        let userCalendar = Calendar(identifier: .gregorian)
        guard let day1 = userCalendar.date(from: dateComponents) else {
            // We royally failed!
            return;
        }
        
        let weekday = Calendar.current.component(.weekday, from: day1)
        
        for _ in 1..<weekday {
            dates.append(DateInfo(day: 0, month: month, year: year))
        }
        
        for i in 1...30 {
            dates.append(DateInfo(day:i, month: month, year: year))
        }
    }
}

struct CalendarMonthView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMonthView(name: "Spooktober", year: 2021, month: 10, numberOfDays: 31)
    }
}

struct DayOfWeekTitlesView: View {
    var body: some View {
        HStack(spacing:0) {
            CalendarWeekDaysTitleView(weekDayTitle: "Sun")
            CalendarWeekDaysTitleView(weekDayTitle: "Mon")
            CalendarWeekDaysTitleView(weekDayTitle: "Tue")
            CalendarWeekDaysTitleView(weekDayTitle: "Wed")
            CalendarWeekDaysTitleView(weekDayTitle: "Thu")
            CalendarWeekDaysTitleView(weekDayTitle: "Fri")
            CalendarWeekDaysTitleView(weekDayTitle: "Sat")
        }
    }
}
