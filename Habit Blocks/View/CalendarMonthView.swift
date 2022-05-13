//
//  CalendarMonthView.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/18/21.
//

import SwiftUI

struct CalendarMonthView: View {
    
    @ObservedObject var calendarInfo: CalendarInfo
    @StateObject var monthInfo: MonthInfo
    
    @State var calendarDays: [[CalendarDayView]] = []
    
    var body: some View {
        VStack(spacing:0) {
            
            HStack {
                Button(action:{
                    calendarInfo.decreaseMonth()
                    monthInfo.buildMonth(month: calendarInfo.month, year: calendarInfo.year)
                    rebuildView()
                }) {
                    Text("<-")
                }
                
                Text(monthInfo.name + ", \(calendarInfo.year)")
                
                Button(action:{
                    calendarInfo.increaseMonth()
                    monthInfo.buildMonth(month: calendarInfo.month, year: calendarInfo.year)
                    rebuildView()
                }) {
                    Text("->")
                }
            }
            
            DayOfWeekTitlesView()
                
            // Loop through the weeks, then loop through the days
            //  and draw each CalendarDayView.
            ForEach (calendarDays, id:\.self) { week in
                HStack(spacing: 0) {
                    ForEach (week, id:\.id) { day in
                        day
                    }
                }.frame(maxWidth:.infinity)
            }
        }.onAppear {
            rebuildView()
        }
    }
    
    func rebuildView() {
        calendarDays = []
        for weekNum in 0..<monthInfo.weeks {
            
            var weekData: [CalendarDayView] = []
            
            for dayNum in 0..<7 {
                let curDateBlock = monthInfo.dates[dayNum + (weekNum * 7)]
                
                
                weekData.append(CalendarDayView(date:curDateBlock.day))
            }
            
            calendarDays.append(weekData)
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
