//
//  main.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/24.
//

import Foundation

//let initialMenu = """
//[ SHAKESHACK MENU ]
//1. Burgers         | 앵거스 비프 통살을 다져만든 버거
//2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림
//3. Drinks          | 매장에서 직접 만드는 음료
//4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
//0. 종료             | 프로그램 종료
//1 <-
//"""
//let burger1 = Burger(name: "불고기버거", price: 3.5, description: "맛있는 불고기가 들어있어요")
//let burger2 = Burger(name: "새우버거", price: 2.0, description: "맛있는 새우가 들어있어요")
//
//let burgerService = BurgerService()
//let iceCreamService = IceCreamService()
//
//while true {
//    print(initialMenu)
//    if let number = readLine() {
//        switch number {
//        case "1":
//
//            burgerService.execute()
//        case "2":
//            iceCreamService.execute()
//        default:
//            print("Unknown")
//        }
//    }
//}

//let burgers: [Burger] = [
//    Burger(name: "Shack Burger", price: 6.9, description: "토마토, 양상추, 쉑소스가 토핑된 치즈버거"),
//    Burger(name: "Smoke Shack", price: 8.9, description: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거"),
//    Burger(name: "Shroom Burger", price: 9.4, description: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거"),
//    Burger(name: "Cheese Burger", price: 6.9, description: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거"),
//    Burger(name: "Hamburger", price: 5.4, description: "비프패티를 기반으로 야채가 들어간 기본버거")
//]
//
//let drinks: [Drink] = [
//    Drink(name: "aaa", price: 5.5, description: "쉑쉑 시그니처 레몬에이드에 향긋한 한라봉 맛이 더해진 레몬에이드"),
//    Drink(name: "bb b", price: 5.0, description: "매장에서 직접 만드는 상크함 레몬에이드"),
//    Drink(name: "sdfjlsdkjf", price: 4.2, description: "직접 유기농 홍차를 우려낸 아이스 티"),
//    Drink(name: "탄산 음료", price: 3.6, description: "코카콜라, 제로코카, 스프라이트, 환타 오렌지, 환타 포도, 환타 파인"),
//    Drink(name: "커피", price: 3.5, description: "쉑 블렌드 원두를 사용한 밸런스 좋은 드립 커피")
//]
//
//let IceCreams: [IceCream] = [
//    IceCream(name: "선데이 아이스크림", price: 2.0, description: "선데이 선데이"),
//    IceCream(name: "팥빙수", price: 5.5, description: "빙수 빙수"),
//]


//func makeMenuString(sellable: [Sellable]) -> String {
//    var tempString = ""
//    for (index, item) in sellable.enumerated() {
//        var itemString = " \(index + 1). \(item.name)"
//        while itemString.count < 19 {
//            itemString.insert(" ", at: itemString.index(itemString.endIndex, offsetBy: 0))
//        }
//        itemString += "| W \(item.price) |  \(item.description)\n"
//        tempString += itemString
//    }
//    return tempString
//}
//
//print(makeMenuString(sellable: drinks))
//var a: [Sellable] = []
//a.append(contentsOf: burgers)
//a.append(contentsOf: drinks)

//let menu = menuMaker.makeMenuString(type: .drink)

// 0. 깃허브에 공유 (깃허브 이메일 받기)
/// 1. 일번을 누르면 버거 메뉴가 나옴 다른버튼을 누를시에는 다른 메뉴가 나와야함 커스타드 메뉴, 드링크, 비어
// 2. 클래스 만들기 현재 클래스에 필요한것은 Burger, Icecream, Drink, Beer 이름, 가격, Description
/// 3. 5번 order, 6번에 cancel을 만듬
let dependency = Dependency()
let app = BurgerApp(dependency: dependency)
app.start()
