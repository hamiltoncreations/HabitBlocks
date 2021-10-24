//
//  ContentView.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/18/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var calendarInfo = CalendarInfo()
    
    var body: some View {
        CalendarMonthView(calendarInfo: calendarInfo, monthInfo: MonthInfo(month: calendarInfo.month, year: calendarInfo.year))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
