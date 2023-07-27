//
//  Date+Ext.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/25.
//

import Foundation

extension Date {
    
    func convertToString() -> String {
        let dateformatter = DateFormatter()
        
        dateformatter.locale = Locale(identifier: "ko_KR")
        dateformatter.timeZone = TimeZone(abbreviation: "KST")

        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateformatter.string(from: self)

    }
    
    func getMintues() -> Int {
        let calendar = Calendar.koreanCalendar
        
        let minute = calendar.component(.minute, from: self)
        return minute
    }
}
