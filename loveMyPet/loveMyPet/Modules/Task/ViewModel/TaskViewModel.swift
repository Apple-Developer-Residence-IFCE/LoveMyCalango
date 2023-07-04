//
//  TaskViewModel.swift
//  loveMyPet
//
//  Created by Vitor Costa on 03/07/23.
//

import Foundation

final class TaskViewModel: ObservableObject {
    
    @Published var catCuriosity: String = ""
    
    init() {
        Task {
            await getCatCuriosity()
        }
    }
    
    @MainActor
    public func getCatCuriosity() async {
        let currentDate = Date()
        
        if let lastFetchDate = UserDefaults.standard.object(forKey: "LastFetchDate") as? Date, Calendar.current.isDate(lastFetchDate, inSameDayAs: currentDate) {
            guard let storedCuriosity = UserDefaults.standard.string(forKey: "CatCuriosity") else {
                catCuriosity = Fact().fact
                return
            }
            
            catCuriosity = storedCuriosity
        } else {
            
            do {
                let curiosity = try await CuriosityService().getCuriosity().fact
                catCuriosity = curiosity
                
                UserDefaults.standard.set(currentDate, forKey: "LastFetchDate")
                UserDefaults.standard.set(curiosity, forKey: "CatCuriosity")
            } catch {
                catCuriosity = Fact().fact
                print(error)
            }
        }
    }
}
