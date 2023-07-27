//
//  Burger.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/26.
//

import Foundation

class Burger: Sellable {
    
    var name: String
    var price: Double
    var description: String
    
    init(name: String, price: Double, description: String) {
        self.name = name
        self.price = price
        self.description = description
    }
}

class ShackShackProduct {
    var name: String
    var price: Double
    var description: String
    
    init(name: String, price: Double, description: String) {
        self.name = name
        self.price = price
        self.description = description
    }
}

class burger1: ShackShackProduct {
    
    
}

class dirnk1: ShackShackProduct {
    
}
