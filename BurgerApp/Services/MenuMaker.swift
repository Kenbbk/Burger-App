//
//  MenuMaker.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/25.
//

import Foundation

struct MenuMaker {
    
    static let shared = MenuMaker()
    
    private init() {}
    
    func makeMenuString(for menu: [Sellable]) -> String {
        
        var tempString = "----------------------------------------------------------------------------------------------------\n"
        for (index, item) in menu.enumerated() {
            var itemString = " \(index + 1). \(item.name)"
            while itemString.count < 19 {
                itemString.insert(" ", at: itemString.index(itemString.endIndex, offsetBy: 0))
            }
            
            itemString += "| W \(item.price) |  \(item.description)\n"
            tempString += itemString
        }
        
            tempString += " 0. Back"
        
        return tempString
    }
    
    func makeCartItemsToString(for menu: [Sellable]) -> String {
        var tempString = ""
        
        for (index, item) in menu.enumerated() {
            var itemString = " \(index + 1). \(item.name)"
            while itemString.count < 19 {
                itemString.insert(" ", at: itemString.index(itemString.endIndex, offsetBy: 0))
            }
            
            itemString += "| W \(item.price) |  \(item.description)\n"
            tempString += itemString
        }
       
        return tempString
    }
}
