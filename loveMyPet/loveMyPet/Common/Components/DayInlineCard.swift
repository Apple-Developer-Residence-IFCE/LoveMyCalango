//
//  DayInlineCard.swift
//  loveMyPet
//
//  Created by José Winny on 03/07/23.
//

import SwiftUI

struct DayInlineCard: View {
    @State var letterDay: String = "D"
    @State var numberDay: Int = 1
    var isSelected: Bool = false
    var fColor: Color {
        isSelected ? Color(CustomColor.White.whiteF4) : Color(CustomColor.FontColor)
    }
    var bColor: Color {
        isSelected ? Color(CustomColor.MainColor) : Color("")
    }
    
    var body: some View {
        VStack {
            Text(letterDay)
                .padding(.bottom,8)
            Text("\(numberDay)")
        }
        .frame(width: 39, height: 64)
        .padding(EdgeInsets(top: 8, leading: 4, bottom: 8, trailing: 4))
        .foregroundColor(fColor)
        .font(.custom(Font.Inter.Bold, size: 20))
        .background(bColor)
        .cornerRadius(4)
        .id(numberDay)
    }
}

struct DayInlineCard_Previews: PreviewProvider {
    static var previews: some View {
        DayInlineCard(letterDay: "S", numberDay: 1, isSelected: true)
    }
}
