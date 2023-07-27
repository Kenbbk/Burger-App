//
//  OrderRepositories.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/25.
//

import Foundation

class OrderRepository {
    
    private var orderList: [Order] = []
    
    func addOrder(order: Order) {
        orderList.append(order)
    }
    
    func bringAllOrders() -> [Order] {
        return orderList
    }
    
    func getQueueNumber() -> Int {
        return orderList.count
    }
}
