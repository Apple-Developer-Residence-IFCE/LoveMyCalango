//
//  TaskType.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 29/06/23.
//

import Foundation

enum TaskType: String, CaseIterable, Identifiable, Hashable {
    var id: Self { self }
    
    case none = "Nenhum"
    case vaccine = "Vacina"
    case medicine = "Remédio"
    case leisure = "Lazer"
    case hygiene = "Higiene"
    case others = "Outros"
}
