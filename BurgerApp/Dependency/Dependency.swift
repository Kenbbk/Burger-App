//
//  Dependency.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/25.
//

import Foundation

class Dependency {
    
    let menuRepository = MenuRepository()
    let orderRepository = OrderRepository()
    let cartRepository = CartRepository()
    
    lazy var beerService = BeerService(menuRepository: menuRepository, cartRepository: cartRepository)
    lazy var iceCreamService = IceCreamService(menuRepository: menuRepository, cartRepository: cartRepository)
    lazy var burgerService = BurgerService(menuRepository: menuRepository, cartRepository: cartRepository)
    lazy var drinkService = DrinkService(menuRepository: menuRepository, cartRepository: cartRepository)
    lazy var orderService = OrderService(cartRepository: cartRepository, orderRepository: orderRepository)
    lazy var cancelService = CancelService(cartRepository: cartRepository)
    lazy var queueService = QueueService(OrderRepository: orderRepository)
}
