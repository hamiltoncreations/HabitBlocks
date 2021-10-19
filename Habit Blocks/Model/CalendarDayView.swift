//
//  CalendarDayView.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/18/21.
//

import SwiftUI

struct CalendarDayView: View {
    
    @State var date: Int
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .aspectRatio(1.0, contentMode: .fit)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
            .overlay(
                Text("\(date)")
            )
    }
}

struct CalendarDayView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDayView(date: 3)
    }
}
