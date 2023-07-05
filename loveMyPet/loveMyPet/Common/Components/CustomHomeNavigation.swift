//
//  HomeModifier.swift
//  loveMyPet
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct CustomHomeNavigation<Home: View, Add: View>: View {

    @ViewBuilder let homeView: Home
    @ViewBuilder let addView: Add
    var action: () -> Void
    var update: () -> Void

    @State private var showingPopover = false

    var body: some View {
        NavigationView{
            homeView
                .navigationBarTitle(Constants.Home.title, displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingPopover = true
                        } label: {
                            Text(Constants.Home.add)
                                .foregroundColor(Color(CustomColor.MainColor))
                                .font(.custom(Font.SemiBold, size: 16))
                        }
                    }
                }
        }
            .sheet(isPresented: $showingPopover, onDismiss: update) {
                NavigationView {
                    addView
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading, content: {
                                Button {
                                    showingPopover = false
                                } label: {
                                    Text(Constants.Home.cancel)
                                        .foregroundColor(Color(CustomColor.MainColor))
                                        .font(.custom(Font.Regular, size: 16))
                                }
                            })
                            ToolbarItem(placement: .navigationBarTrailing, content: {
                                Button {
                                    action()
                                    showingPopover = false
                                } label: {
                                    Text(Constants.Home.add)
                                        .font(.custom(Font.SemiBold, size: 16))
                                }
                                .disabled(Helper.shared.addButtonDisable)
                                .tint(Helper.shared.addButtonDisable ? Color.gray : Color(CustomColor.MainColor))
                            })
                        }
                }
            }
    }
}

