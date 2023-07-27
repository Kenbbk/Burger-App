//
//  BurgerApp.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/25.
//

import Foundation


enum ReadError: String, Error {
    case nothingTyped = "Nothing typed"
    case notInt = "It cannot conver to Int"
    case outOfBound = "Out of bound"
}


class BurgerApp {
    
    var beerService: BeerService
    var iceCreamService: IceCreamService
    var burgerService: BurgerService
    var drinkService: DrinkService
    var orderService: OrderService
    var cancelService: CancelService
    var queueService: QueueService
    
    let startingMenu = """
[ SHAKESHACK MENU ]
1. Burgers         | 앵거스 비프 통살을 다져만든 버거
2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림
3. Drinks          | 매장에서 직접 만드는 음료
4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
5. Order           | 장바구니를 확인 후 주문합니다.
6. Cancel          | 진행중인 주문을 취소합니다.
"""
    
    
    init(dependency: Dependency) {
        self.beerService = dependency.beerService
        self.iceCreamService = dependency.iceCreamService
        self.burgerService = dependency.burgerService
        self.drinkService = dependency.drinkService
        self.orderService = dependency.orderService
        self.cancelService = dependency.cancelService
        self.queueService = dependency.queueService
        
    }
    
    func start() {
        printQueueMessage()
        
    outerLoop: while true {
        
        print(startingMenu)
        do {
            let number = try ReadLiner.shared.readNumber(count: 6)
            switch number {
            case 0:
                printTerminatingMessage()
                break outerLoop
                
            case 1:
                burgerService.execute()
            case 2:
                iceCreamService.execute()
            case 3:
                drinkService.execute()
            case 4:
                beerService.execute()
            case 5:
                orderService.execute()
            case 6:
                cancelService.execute()
            default:
                print("Unknown")
            }
            
            
        } catch ReadError.nothingTyped {
            print(ReadError.nothingTyped.rawValue)
        } catch ReadError.notInt {
            print(ReadError.notInt.rawValue)
        } catch ReadError.outOfBound {
            print(ReadError.outOfBound.rawValue)
        } catch {
            print("Unkown Error")
        }
        
    }
        
        
    }
    
    private func printTerminatingMessage() {
        print("종료됨")
    }
    
    private func printQueueMessage() {
        
        DispatchQueue.global(qos: .background).async {
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                print(self.queueService.getQueueText())
            }
            RunLoop.current.run()
        }
    }
}





