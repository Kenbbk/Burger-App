//
//  BurgerService.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/24.
//

import Foundation

class BurgerService {
    
    private let burgers: [Sellable]
    private let cartRepository: CartRepository
    init(menuRepository: MenuRepository, cartRepository: CartRepository) {
        
        self.burgers = menuRepository.burgers
        self.cartRepository = cartRepository
    }
    
    func execute() {
        
        do {
        outerLoop: while true {
            let burgerMenuString = MenuMaker.shared.makeMenuString(for: burgers)
            print(burgerMenuString)
            
            let number = try ReadLiner.shared.readNumber(count: burgers.count)
            
            if number == 0 {
                break outerLoop
            }
            
            let selectedBurger = burgers[ number - 1]
            print(MenuMaker.shared.makeCartItemsToString(for: [selectedBurger]))
            print("위 메뉴를 장바구니에 추가하시겠습니까?\n1. 확인        2. 취소")
            let yesNoNumber = try ReadLiner.shared.readNumberForYesAndNo()
            
            switch yesNoNumber {
            case 1:
                print("장바구니에 추가 되었습니다")
                cartRepository.addToCart(item: selectedBurger)
                break outerLoop
                
            default:
                continue
            }
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
        
        
        
        
        
        
        
        
        
        
        

