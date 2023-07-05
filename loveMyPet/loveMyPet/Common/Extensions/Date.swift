//
//  Date.swift
//  loveMyPet
//
//  Created by José Winny on 04/07/23.
//

import Foundation

extension Date {
    func firstLetterOfWeekdayForMonth() throws -> [String] {
        let calendar = Calendar.current
        let currentDate = Date()
        let year = calendar.component(.year, from: currentDate)
        let month = calendar.component(.month, from: currentDate)
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = 1
        
        guard let startDate = calendar.date(from: dateComponents) else {
            throw CustomError.FailToCreateInitialDate
        }
        
        guard let range = calendar.range(of: .day, in: .month, for: startDate) else {
            throw CustomError.FailToGetDayIntervalOnMonth
        }
        
        var firstLetters: [String] = []
        
        for day in range {
            dateComponents.day = day
            guard let date = calendar.date(from: dateComponents) else {
                throw CustomError.FailToCreateDate
            }
            
            let weekday = calendar.component(.weekday, from: date)
            let nameDay = DiasDaSemana(rawValue: weekday)!
            let letterOfDay = String(describing: nameDay).first ?? "-"
            
            firstLetters.append(String(letterOfDay))
        }
        
        return firstLetters
    }
    
    func dayOfMonth () -> Int {
        let myCalendar = Calendar(identifier: .gregorian)
        let today = myCalendar.dateComponents([.day], from: Date())
        return today.day ?? 0
    }
}
