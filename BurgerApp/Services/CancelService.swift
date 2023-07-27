//
//  CancelService.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/25.
//

import Foundation

class CancelService {
    
    let cartRepository: CartRepository
    
    func execute() {
        
        if cartIsEmpty() {
            print(" ------------------------- 카트가 비어있습니다 ------------------")
            return
        }
        
        print("장바구니를 비우시겠습니까?\n1. 확인        2. 취소")
        do {
            let number = try ReadLiner.shared.readNumberForYesAndNo()
            switch number {
            case 1:
                cartRepository.emptyCart()
                print("--------------------------- 장바구니를 초기화했습니다 ------------------")
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
    
    init(cartRepository: CartRepository) {
        self.cartRepository = cartRepository
    }
    
    func cartIsEmpty() -> Bool {
        return cartRepository.bringAllItem().isEmpty
    }
}
