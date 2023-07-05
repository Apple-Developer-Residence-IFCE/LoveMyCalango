//
//  TaskViewModel.swift
//  loveMyPet
//
//  Created by José Winny on 04/07/23.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var days: [String] = []
    @Published var today : Int = 1
    init() {
        do {
            days = try Date().firstLetterOfWeekdayForMonth()
        } catch {
            print("Erro ao criar o array: \(error)")
        }
        today = Date().dayOfMonth()
    }
    
}

