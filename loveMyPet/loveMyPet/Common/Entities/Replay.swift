//
//  Repeat.swift
//  loveMyPet
//
//  Created by Rodrigo Mendes on 29/06/23.
//

import Foundation

enum Replay: String, CaseIterable, Identifiable, Hashable {
    var id: Self { self }
    
    case never = "Nunca"
    case everyDay = "Todo dia"
    case everyWeek = "Toda semana"
    case everyFortnight = "A cada 2 semanas"
    case everyMonth = "Todo mês"
    case everyYear = "Todo ano"
    case custom = "Personalizado"
}
