//
//  CalendarDayView.swift
//  Habit Blocks
//
//  Created by Matthew Hamilton on 10/18/21.
//

import SwiftUI

struct CalendarDayView: View, Hashable {
    
    static func == (lhs: CalendarDayView, rhs: CalendarDayView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    @State var date: Int
    var id = UUID()
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .aspectRatio(1.0, contentMode: .fit)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
            .overlay(
                VStack {
                    HStack {
                        if (date > 0) {
                            Text("\(date)").padding(3).font(.caption2)
                        }
                        Spacer()
                    }
                    Spacer()
                }
            )
    }
}

struct CalendarDayView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDayView(date: 3)
    }
}
