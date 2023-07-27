//
//  Calendar+Ext.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/27.
//

import Foundation

extension Calendar {
    
    static let koreanCalendar = {
        var calendar = Calendar.current
        calendar.timeZone =  TimeZone(abbreviation: "KST")!
        calendar.locale = Locale(identifier: "ko_KR")
        return calendar
    }()
    
}
