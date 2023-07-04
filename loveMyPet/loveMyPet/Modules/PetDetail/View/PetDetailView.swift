//
//  PetDetail.swift
//  loveMyPet
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct PetDetailView: View {
    
    var pet: NewPet
    @StateObject var viewModel: PetDetailViewModel = PetDetailViewModel()
    
    var body: some View {
        VStack{
            Image(uiImage: UIImage(data: pet.image ) ?? UIImage(named: Assets.Image.logo) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 194)
                .clipped()
            
            VStack(alignment: .leading, spacing: 16.0) {
                HStack{
                    Text(Constants.Detail.info)
                        .font(.custom(Font.SemiBold, size: 20))
                    Spacer()
                    Image(pet.gender.rawValue == Constants.female ? Assets.Icon.female : (pet.gender.rawValue == Constants.none ? Assets.Icon.none : Assets.Icon.male))
                }
                
                PetData(title: Constants.Detail.name, value: pet.name)
                PetData(title: Constants.Detail.specie, value: pet.specie.rawValue)
                PetData(title: Constants.Detail.birth, value: viewModel.formattedBirthDate(date: pet.birthDate ))
                PetData(title: Constants.Detail.breed, value: pet.breed)
                PetData(title: Constants.Picker.weight, value: viewModel.formattedWeight(weight: pet.weight))
                
                Divider().frame(height: 4).overlay(Color(CustomColor.Gray.neutral300))
                
                VStack(alignment: .leading, spacing: 14){
                    Text(Constants.Detail.addeds)
                        .font(.custom(Font.SemiBold, size: 20))
                    
                    PetData(title: Constants.Detail.isNeutered, value: pet.isNeutered ? Constants.yes : Constants.no)
                }
            }
            .padding(24.0)
            Spacer()
        }
        .background(Color(CustomColor.BackgroundColor))
    }
}
