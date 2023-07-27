//
//  QueueService.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/27.
//

import Foundation

class QueueService {
    
    private let orderRepository: OrderRepository
    
    
    init(OrderRepository: OrderRepository) {
        self.orderRepository = OrderRepository
    }
    
    func getQueueText() -> String {
        let queue = orderRepository.getQueueNumber()
        let text = "현재 대기자수는 \(queue) 입니다"
        return text
        
    }
}
