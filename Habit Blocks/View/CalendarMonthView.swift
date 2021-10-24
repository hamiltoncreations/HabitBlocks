//
//  CalendarMonthView.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/18/21.
//

import SwiftUI

struct CalendarMonthView: View {
    
    @ObservedObject var calendarInfo: CalendarInfo
    @ObservedObject var monthInfo: MonthInfo
    
    var body: some View {
        VStack(spacing:0) {
            
            
            Text(monthInfo.name + ", \(calendarInfo.year)")
            
            HStack {
                Button(action:{
                    calendarInfo.decreaseMonth()
                    monthInfo.buildMonth(month: calendarInfo.month, year: calendarInfo.year)
                }) {
                    Text("<-")
                }
                
                DayOfWeekTitlesView()
                
                Button(action:{
                    calendarInfo.increaseMonth()
                    monthInfo.buildMonth(month: calendarInfo.month, year: calendarInfo.year)
                    
                }) {
                    Text("->")
                }
            }
            
            let numWeeks = monthInfo.dates.count/7
                
            // Loop through the weeks, then loop through the days
            //  and draw each CalendarDayView.
            ForEach((0..<numWeeks), id: \.self) {weekNum in
                HStack(spacing: 0) {
                    ForEach((0..<7), id: \.self) { itr in
                        
                        let curDateBlock = monthInfo.dates[itr + (weekNum * 7)]
                        CalendarDayView(date:curDateBlock.day)
                        
                    }
                }.frame(maxWidth:.infinity)
            }
        }
    }
    
}

struct CalendarMonthView_Previews: PreviewProvider {
    static var previews: some View {
        let calendarInfo = CalendarInfo()
        CalendarMonthView(calendarInfo: calendarInfo, monthInfo: MonthInfo(month: calendarInfo.month, year: calendarInfo.year))
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
