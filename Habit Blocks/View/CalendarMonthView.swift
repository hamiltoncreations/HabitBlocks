//
//  CalendarMonthView.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/18/21.
//

import SwiftUI

struct CalendarMonthView: View {
    
    @State var name: String = ""
    var year: Int
    var month: Int
    @State var dates: [DateInfo]!
    
    var body: some View {
        VStack(spacing:0) {
            
            Text(name + ", \(year)")
            
            DayOfWeekTitlesView()
            
            if let dates = dates {
                let numWeeks = dates.count/7
                
                // Loop through the weeks, then loop through the days
                //  and draw each CalendarDayView.
                ForEach((0..<numWeeks), id: \.self) {weekNum in
                    HStack(spacing: 0) {
                        ForEach((0..<7), id: \.self) { itr in
                            
                            let curDateBlock = dates[itr + (weekNum * 7)]
                            CalendarDayView(date:curDateBlock.day)
                            
                        }
                    }.frame(maxWidth:.infinity)
                }
            }
        }
        .onAppear {
            buildDates()
        }
    }
    
    /// Builds the dates object for rendering the month.
    ///
    ///  This method will use the object's year and month values to determine the correct
    ///     amount of days to populate the month with and the correct first day of the
    ///     week.
    func buildDates() {
        dates = []
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = 1
        
        let userCalendar = Calendar(identifier: .gregorian)
        guard let day1 = userCalendar.date(from: dateComponents) else {
            // Not a valid month/year
            return;
        }
        
        name = getNameOfMonth(date: day1)
        
        // Prepopulate dates with filler dates to arrive at the
        //  correct day of the week for the first day.
        let weekday = Calendar.current.component(.weekday, from: day1)
        for _ in 1..<weekday {
            dates.append(DateInfo(day: 0, month: month, year: year))
        }
        
        // Fill in the rest of the month's dates.
        let range = userCalendar.range(of: .day, in: .month, for: day1)!
        for i in 1...range.count {
            dates.append(DateInfo(day:i, month: month, year: year))
        }
        
        // Add filler dates for the rest of the week.
        // The view depends on this to draw correctly.
        while dates.count % 7 != 0 {
            dates.append(DateInfo(day: 0, month: month, year: year))
        }
    }
    
    func getNameOfMonth(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: date)
        
        return nameOfMonth
    }
}

struct CalendarMonthView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMonthView(year: 2021, month: 10)
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
