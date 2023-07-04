//
//  ConfigView.swift
//  loveMyPet
//
//  Created by Vitor Costa on 12/06/23.
//

import SwiftUI

struct ConfigView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(Constants.Config.title)
                .font(.custom(Font.SemiBold, size: 32))
                .foregroundColor(Color(CustomColor.FontColor))
                .padding(.bottom, 32)
            
            Text(Constants.Config.appereance)
                .font(.custom(Font.SemiBold, size: 14))
                .foregroundColor(Color(CustomColor.FontColor))
            
            ConfigOptions()
                .padding(.top, 20)
                .padding(.leading, 8)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 40)
        .padding(.leading, 24)
        .background(Color(CustomColor.BackgroundColor))
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
