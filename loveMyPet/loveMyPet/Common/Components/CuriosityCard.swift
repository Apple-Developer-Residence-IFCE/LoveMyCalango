//
//  CuriosityCard.swift
//  loveMyPet
//
//  Created by Vitor Costa on 30/06/23.
//

import SwiftUI

struct CuriosityCard: View {
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            Image(Assets.Image.CuriosityPetFace)
            
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(Color(CustomColor.MainColor))
                    .font(.custom(Font.SemiBold, size: 16))
                Text(description)
                    .font(.custom(Font.Regular, size: 13))
                    .multilineTextAlignment(TextAlignment.leading)
            }
            .padding(.vertical, 10)
            Spacer()
            
        }
        .frame(height: 141)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(CustomColor.BorderCardPet), lineWidth: 4)
        )
        .background(Color(CustomColor.PetBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 24)
    }
}

