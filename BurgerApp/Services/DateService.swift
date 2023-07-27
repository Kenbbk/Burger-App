//
//  DateService.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/26.
//

import Foundation

struct DateService {
    
    
    
    func isUnavailablePayTime(date: Date) -> Bool {
        let calendar = Calendar.koreanCalendar
        
        let component = calendar.dateComponents([.year, .month, .day], from: date)
        let year = component.year
        let month = component.month
        let day = component.day
        let hour = 23
        let startMinutes = 10
        let endMintues = 20
        let beforeComponent = DateComponents(calendar: calendar, year: year, month: month, day: day, hour: hour, minute: startMinutes)
        let afterComponent = DateComponents(calendar: calendar, year: year, month: month, day: day, hour: hour, minute: endMintues)
        let beforeTime = calendar.date(from: beforeComponent)!
        let afterTime = calendar.date(from: afterComponent)!
       
        return date >= beforeTime && date <= afterTime
        
        
    }
}
