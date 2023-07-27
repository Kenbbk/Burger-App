//
//  OrderService.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/25.
//

import Foundation

class OrderService {
    
    let customer = Customer(name: "Woojun", balance: 100)
    var cartRepository: CartRepository
    var orderRepository: OrderRepository
    
    func execute() {
        
        do {
            let allItems = cartRepository.bringAllItem()
            
            if cartIsEmpty() {
                print(" ------------------------------ 카트가 비어있습니다 -------------------")
                return
            }
            
            print(MenuMaker.shared.makeCartItemsToString(for: allItems))
            let moneyService = MoneyService()
            
            let price = moneyService.checkPrice(items: allItems)
            
            printConfirm(items: allItems, price: price)
            
            let number = try ReadLiner.shared.readNumberForYesAndNo()
            switch number {
            case 1:
                
                guard MustBeAvailableTime() else {
                    NotifyItIsUnavailableTime()
                    return
                }
                
                guard moneyService.checkEnoughMoney(customer: customer, amount: price) else {
                    print("현재 잔액은 \(customer.balance) 으로 \(price - customer.balance)이 부족해서 주문할 수 없습니다.")
                    return
                }
                
                guard price > 0 else { return }
                moneyService.payMoney(customer: customer, amount: price)
                
                let order = Order(orderer: customer, items: allItems, price: price)
                orderRepository.addOrder(order: order)
                
                cartRepository.emptyCart()
                sleepForProcessing()
                printComplete()
                
                
            default:
                return
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
    
    init(cartRepository: CartRepository, orderRepository: OrderRepository) {
        self.cartRepository = cartRepository
        self.orderRepository = orderRepository
    }
    
    
    
    private func printConfirm(items: [Sellable], price: Double) {
        
        let waiting = orderRepository.bringAllOrders().count
        var string = "아래와 같이 주문 하시겠습니까? (현재 주문 대기수: \(waiting))\n\n [ Orders ]\n" + MenuMaker.shared.makeCartItemsToString(for: items)
        string += "\n [ Total ]\n W \(price) \n\n 1. 주문      2. 메뉴판"
        print(string)
        
    }
    
    private func printComplete() {
        let string1 = "-------------------------------------------------------------"
        let string2 = "\n결제를 완료했습니다. (\(Date().convertToString()))\n"
        let string3 = "--------------------------------------------------------------"
        print(string1 + string2 + string3)
    }
    
    private func sleepForProcessing() {
        let string1 = "-------------------------------------------------------------"
        let string2 = "\n결제를 진행중입니다 잠시만 기다려주세요\n"
        let string3 = "--------------------------------------------------------------"
        print(string1 + string2 + string3)
        sleep(3)
        
    }
    
    private func MustBeAvailableTime() -> Bool {
        
        return !DateService().isUnavailablePayTime(date: Date())
    }
    
    private func NotifyItIsUnavailableTime() {
        let mintue = Date().getMintues()
        print("현재 시각은 오후11시 \(mintue)분입니다. 은행 점검 시간은 오후11시 10분 ~ 오후 11시 20분이므로 결제할 수 없습니다.")
    }
    
    private func cartIsEmpty() -> Bool {
        let allItems = cartRepository.bringAllItem()
        return allItems.isEmpty
    }
}

