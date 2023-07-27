//
//  MenuRepositories.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/25.
//

import Foundation

class MenuRepository {
    
    let burgers: [Burger] = [
        Burger(name: "Shack Burger", price: 6.9, description: "토마토, 양상추, 쉑소스가 토핑된 치즈버거"),
        Burger(name: "Smoke Shack", price: 8.9, description: "베이컨, 체리 페퍼에 쉑소스가 토핑된 치즈버거"),
        Burger(name: "Shroom Burger", price: 9.4, description: "몬스터 치즈와 체다 치즈로 속을 채운 베지테리안 버거"),
        Burger(name: "Cheese Burger", price: 6.9, description: "포테이토 번과 비프패티, 치즈가 토핑된 치즈버거"),
        Burger(name: "Hamburger", price: 5.4, description: "비프패티를 기반으로 야채가 들어간 기본버거")
    ]
    
     let drinks: [Drink] = [
        Drink(name: "Lemonade", price: 5.5, description: "쉑쉑 시그니처 레몬에이드에 향긋한 한라봉 맛이 더해진 레몬에이드"),
        Drink(name: "Lemonade2", price: 5.0, description: "매장에서 직접 만드는 상크함 레몬에이드"),
        Drink(name: "Red Tea", price: 4.2, description: "직접 유기농 홍차를 우려낸 아이스 티"),
        Drink(name: "Soft Drink", price: 3.6, description: "코카콜라, 제로코카, 스프라이트, 환타 오렌지, 환타 포도, 환타 파인"),
        Drink(name: "Coffee", price: 3.5, description: "쉑 블렌드 원두를 사용한 밸런스 좋은 드립 커피")
    ]
    
     let iceCreams: [IceCream] = [
        IceCream(name: "Sundae", price: 2.0, description: "선데이 선데이"),
        IceCream(name: "Shaved Ice", price: 5.5, description: "빙수 빙수"),
    ]
    
     let beer: [Beer] = [
        Beer(name: "Heineken", price: 4.0, description: "Heineken"),
        Beer(name: "Cass", price: 3.0, description: "Cass")
    ]
    
    
    
}
