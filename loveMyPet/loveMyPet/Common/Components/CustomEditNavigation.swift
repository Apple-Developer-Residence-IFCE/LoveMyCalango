//
//  CustomEditNavigation.swift
//  loveMyPet
//
//  Created by Ravi on 16/06/23.
//

import SwiftUI

struct CustomEditNavigation<Detail: View, Edit: View>: View {

    @ViewBuilder let detailPet: Detail
    @ViewBuilder let editView: Edit
    @State private var showingSheet = false
    var update: () -> Void

    var body: some View {
        detailPet
            .navigationBarTitle(Text(Constants.Home.infoPetTitle), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingSheet = true
                    } label: {
                        Text(Constants.Home.edit)
                            .foregroundColor(Color(CustomColor.MainColor))
                            .font(.custom(Font.SemiBold, size: 16))
                    }
                }
            }
            .sheet(isPresented: $showingSheet, onDismiss: { update() }) {
                NavigationView{
                    editView
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading, content: {
                                Button {
                                    showingSheet = false
                                } label: {
                                    Text(Constants.Home.cancel)
                                        .foregroundColor(Color(CustomColor.MainColor))
                                        .font(.custom(Font.Regular, size: 16))
                                }
                            })
                        }
                }
            }
    }
}

