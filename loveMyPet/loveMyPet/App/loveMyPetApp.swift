//
//  loveMyPetApp.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

@main
struct loveMyPetApp: App {
    
    @AppStorage("preferredColor") var preferredColor: AppColorScheme = .system
    @State var selectedTab: TabContextView = .pets
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var addViewModel = EditPetViewModel()
    @ObservedObject var taskViewModel = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CustomTabView(selectedTab: $selectedTab) {
                    CustomHomeNavigation {
                        HomeView(homeViewModel: homeViewModel)
                    } addView: {
                        EditPetView(addViewModel: addViewModel)
                            .navigationTitle(Constants.Home.addPetTitle)
                            .navigationBarTitleDisplayMode(.inline)
                    } action: {
                        addViewModel.updatePet()
                        Helper.shared.AddButtonDisable = true
                    } update: {
                        homeViewModel.fetchAllPets()
                        addViewModel.newPet = NewPet()
                    }
                }
                configView: {
                    ConfigView()
                } taskView: {
                    TaskView()
                        .environmentObject(taskViewModel)
                }
                .toolbar(selectedTab == .pets ? .visible : .hidden, for: .navigationBar)
                .navigationTitle(selectedTab == .pets ? TabContextView.pets.rawValue : "")
                .navigationBarTitleDisplayMode(selectedTab == .pets ? .inline : .large)
                .preferredColorScheme(Helper.shared.convertToColorScheme(customColorScheme: preferredColor))
            }
            .accentColor(Color(CustomColor.MainColor))
        }
    }
}


