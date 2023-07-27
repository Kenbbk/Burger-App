//
//  IceCreamService.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/24.
//

import Foundation

class IceCreamService {
    
    private let iceCreams: [Sellable]
    private let cartRepository: CartRepository
    init(menuRepository: MenuRepository, cartRepository: CartRepository) {
        
        self.iceCreams = menuRepository.iceCreams
        self.cartRepository = cartRepository
    }
    
    func execute() {
        do {
        outerLoop: while true {
            
            
            let burgerMenuString = MenuMaker.shared.makeMenuString(for: iceCreams)
            print(burgerMenuString)
            
            let number = try ReadLiner.shared.readNumber(count: iceCreams.count)
            
            if number == 0 {
                break outerLoop
            }
            
            let selectedIceCream = iceCreams[ number - 1]
            print(MenuMaker.shared.makeCartItemsToString(for: [selectedIceCream]))
            print("위 메뉴를 장바구니에 추가하시겠습니까?\n1. 확인        2. 취소")
            let yesNoNumber = try ReadLiner.shared.readNumberForYesAndNo()
            
            switch yesNoNumber {
            case 1:
                print("장바구니에 추가 되었습니다")
                cartRepository.addToCart(item: selectedIceCream)
                break outerLoop
                
            case 2:
                continue
            default:
                print("Not Yes or No")
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
