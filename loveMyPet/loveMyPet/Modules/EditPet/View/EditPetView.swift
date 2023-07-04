//
//  EditPetView.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI
import PhotosUI

struct EditPetView: View {

    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: EditPetViewModel
    @StateObject private var imagePicker = ImagePicker()
    @State private var isShowingImagePicker = false
    
    init(addViewModel: EditPetViewModel) {
        viewModel = addViewModel
    }

    init(editViewModel: EditPetViewModel) {
        viewModel = editViewModel
    }
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $imagePicker.imageSelection) {
                VStack {
                    if let image = imagePicker.image {
                        Image(uiImage: (UIImage(data: image) ?? UIImage()))
                            .resizable()
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                    } else {
                        if viewModel.isAddPetFlow {
                            Image(Assets.Image.avatarCat2)
                                .resizable()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                        } else {
                            Image(uiImage: (UIImage(data: viewModel.selectedPet.image) ?? UIImage(named: Assets.Image.logo)) ?? UIImage())
                                .resizable()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                        }
                    }
                    
                    Text(Constants.Home.changePicture)
                        .font(.custom(Font.Regular, size: 13))
                        .foregroundColor(Color(CustomColor.FontColor))
                }
            }
            .onChange(of: imagePicker.image ?? Data(), perform: { newValue in
                viewModel.changePetImage(data: newValue)
            })
            .padding(.top, 16)
            
            FormView(viewModel: viewModel)
            
            if !viewModel.isAddPetFlow {
                RemovePetButton(viewModel: viewModel, showAlert: false, dismiss: {dismiss()})
            }
        }
        .onDisappear {
            //Zerando os valores do formulário
            viewModel.selectedPet = NewPet()
            viewModel.weight = ""
            viewModel.weightKG = 0
            viewModel.weightG = 0
        }
        .toolbar {
            if viewModel.isAddPetFlow == false {
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button {
                            viewModel.updatePet()
                            Helper.shared.AddButtonDisable = true
                            dismiss()
                        } label: {
                            Text(Constants.Home.save)
                                .font(.custom(Font.SemiBold, size: 16))
                        }
                        .tint(Color(CustomColor.MainColor))
                    })
            }
        }
        .background(Color(CustomColor.BackgroundColor))
    }
}

