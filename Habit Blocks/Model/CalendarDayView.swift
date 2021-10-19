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
            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
