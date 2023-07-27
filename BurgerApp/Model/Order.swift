//
//  Order.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/25.
//

import Foundation

class Order {
    let orderer: Customer
    let items: [Sellable]
    let price: Double
    
    init(orderer: Customer, items: [Sellable], price: Double) {
        self.orderer = orderer
        self.items = items
        self.price = price
    }
    
    
}
