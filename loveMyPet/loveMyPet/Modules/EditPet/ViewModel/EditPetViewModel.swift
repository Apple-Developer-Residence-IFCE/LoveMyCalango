//
//  EditPetViewModel.swift
//  loveMyPet
//
//  Created by Ravi navarro on 27/05/23.
//

import SwiftUI

final class EditPetViewModel: ObservableObject {

    @Published var selectedPet: Pet
    
    init(selectedPet: Pet) {
        self.selectedPet = selectedPet
    }
}
