//
//  CartRepositories.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/25.
//

import Foundation

class CartRepository {
    
    private var insideCart: [Sellable] = []

    func addToCart(item: Sellable) {
        insideCart.append(item)
    }
    
    func emptyCart() {
        insideCart.removeAll()
    }
    
    func bringAllItem() -> [Sellable] {
        return insideCart
    }
}
