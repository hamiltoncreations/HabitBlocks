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
    @State var dates: [DateInfo]!
    
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
            
            HStack(spacing: 0) {
                if let dates = dates {
                    ForEach((0..<7), id: \.self) { itr in
                        
                        CalendarDayView(date:dates[itr].day)
                    }
                }
            }.frame(maxWidth:.infinity)
            HStack(spacing: 0) {
                if let dates = dates {
                    ForEach((7..<14), id: \.self) { itr in
                        
                        CalendarDayView(date:dates[itr].day)
                    }
                }
            }.frame(maxWidth:.infinity)
            HStack(spacing: 0) {
                if let dates = dates {
                    ForEach((14..<21), id: \.self) { itr in
                        
                        CalendarDayView(date:dates[itr].day)
                    }
                }
            }.frame(maxWidth:.infinity)
            HStack(spacing: 0) {
                if let dates = dates {
                    ForEach((21..<28), id: \.self) { itr in
                        
                        CalendarDayView(date:dates[itr].day)
                    }
                }
            }.frame(maxWidth:.infinity)
        }
        .onAppear {
            buildDates()
        }
    }
    
    func buildDates() {
        dates = []
        
        for i in 1...30 {
            dates.append(DateInfo(day:i, month: 10, year: 2021))
        }
    }
}

struct CalendarMonthView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarMonthView(name: "Spooktober", numberOfDays: 31)
    }
}
