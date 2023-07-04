//
//  HomeView.swift
//  loveMyPet
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            if homeViewModel.pets.isEmpty {
                EmptyHome()
            } else {
                Grid {
                    ForEach(homeViewModel.pets, id: \.id) { pet in
                        VStack {
                            GridRow {
                                NavigationLink {
                                    CustomEditNavigation(detailPet: {
                                        PetDetailView(pet: pet)
                                    }, editView: {
                                        EditPetView(editViewModel: EditPetViewModel(pet: pet))
                                            .navigationTitle(Constants.Home.editPetTitle)
                                            .navigationBarTitleDisplayMode(.inline)
                                    }, update: { homeViewModel.fetchAllPets() })
                                } label: {
                                    CardPet(item: pet)
                                }
                            }
                        }
                    }
                }
                .padding(.top, 48)
            }
        }.onAppear{
            homeViewModel.fetchAllPets()
        }
        .background(Color(CustomColor.BackgroundColor))
    }
}

struct EmptyHome: View {
    
    var body: some View {
        VStack {
            Image(Assets.Image.emptyPet)
                .resizable()
                .padding(.horizontal, 24)
                .padding(.bottom, 18)
            Text(Constants.Home.emptyPets)
                .foregroundColor(Color(CustomColor.EmptyMessageHome))
                .multilineTextAlignment(.center)
                .font(.custom(Font.Medium, size: 18))
            Spacer()
        }
        .padding(.top, 32)
    }
}
