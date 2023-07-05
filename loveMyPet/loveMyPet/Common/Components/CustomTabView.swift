//
//  HomeTabView.swift
//  loveMyPet
//
//  Created by Isaias Dimitri on 06/06/23.
//

import SwiftUI

struct CustomTabView<Home: View, Config: View, Task: View>: View {
    @Binding var selectedTab: TabContextView
    @ViewBuilder let homeView: Home
    @ViewBuilder let configView: Config
    @ViewBuilder let taskView: Task
    var body: some View {
            TabView(selection: $selectedTab){
                taskView
                    .tabItem {
                        Label{
                            Text(TabContextView.task.rawValue)
                                .foregroundColor(.white)
                        } icon: {
                            Image(selectedTab == .task ?
                                  Assets.Icon.taskFilled : Assets.Icon.task)
                        }
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(Color(CustomColor.TabViewBackground), for: .tabBar)
                    .tag(TabContextView.task)
                
                    homeView
                        .tabItem {
                            Label {
                                Text(TabContextView.pets.rawValue)
                                    .foregroundColor(Color(CustomColor.MainColor, bundle: .main))
                            } icon: {
                                Image(selectedTab == .pets ? Assets.Icon.petFilled : Assets.Icon.pet)
                            }
                        }
                        .toolbarBackground(.visible, for: .tabBar)
                        .toolbarBackground(Color(CustomColor.TabViewBackground), for: .tabBar)
                        .tag(TabContextView.pets)
                
                configView
                    .tabItem {
                        Label{
                            Text(TabContextView.config.rawValue)
                                .foregroundColor(.white)
                        } icon: {
                            Image(selectedTab == .config ?
                                  Assets.Icon.configFilled : Assets.Icon.config)
                        }
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(Color(CustomColor.TabViewBackground), for: .tabBar)
                    .tag(TabContextView.config)
                
            }
            .accentColor(Color(CustomColor.MainColor))
        }
}
