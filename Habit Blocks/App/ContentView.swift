//
//  ContentView.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/18/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CalendarMonthView(name: "October", numberOfDays: 31)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
