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
        CalendarMonthView(calendarInfo: CalendarInfo(), monthInfo: MonthInfo(month: 10, year: 2021))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
