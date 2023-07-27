//
//  MoneyService.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/26.
//

import Foundation

struct MoneyService {
    
    func checkPrice(items: [Sellable]) -> Double {
        let prices = items.map { $0.price }
        let price = prices.reduce(0) { $0 + $1}
        return price
    }
    
    func checkEnoughMoney(customer: Customer, amount: Double) -> Bool {
        return customer.balance >= amount
    }
    
    func payMoney(customer: Customer ,amount: Double) {
        customer.balance -= amount
    }
}
