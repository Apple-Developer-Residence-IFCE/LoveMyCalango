//
//  InlineCalendar.swift
//  loveMyPet
//
//  Created by José Winny on 29/06/23.
//

import SwiftUI

struct InlineCalendar: View {
    @Binding var listOfLetterDay: [String]
    @Binding var selectDay: Int
    let today = Calendar.current.component(.day, from: Date())
    let rows = [GridItem(.fixed(40))]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { roller in
                LazyHGrid(rows: rows,alignment: .top,spacing: 1){
                    ForEach(1...listOfLetterDay.count, id: \.self) { day in
                        DayInlineCard(letterDay: listOfLetterDay[day - 1], numberDay: day, isSelected: day == selectDay)
                            .onTapGesture {
                                selectDay = day
                            }
                    }
                }
                .onAppear {
                    selectDay = today
                    roller.scrollTo(selectDay, anchor: .center)
                }
            }
        }
    }
}
