//
//  CalendarWeekDaysTitleView.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/19/21.
//

import SwiftUI

struct CalendarWeekDaysTitleView: View {
    
    @State var weekDayTitle: String
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .aspectRatio(1.0, contentMode: .fit)
            .overlay(
                Text(weekDayTitle)
            )
    }
}

struct CalendarWeekDaysTitleView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarWeekDaysTitleView(weekDayTitle: "M")
    }
}
