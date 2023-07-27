//
//  ReadLiner.swift
//  BurgerApp
//
//  Created by Woojun Lee on 2023/07/25.
//

import Foundation

struct ReadLiner {
    
    static let shared = ReadLiner()
    
    private init() {}
    
    func readNumber(count: Int, inclduingZero: Bool = true) throws -> Int {
        guard let typedLine = readLine() else {
            throw ReadError.nothingTyped
        }
        
        guard let number = Int(typedLine) else {
            throw ReadError.notInt
        }
        
        let passRange = inclduingZero ? 0...count : 1...count
        
        guard passRange.contains(number) else {
            throw ReadError.outOfBound
        }
        
        return number
    }
    
    func readNumberForYesAndNo() throws -> Int {
        guard let typedLine = readLine() else {
            throw ReadError.nothingTyped
        }
        
        guard let number = Int(typedLine) else {
            throw ReadError.notInt
        }
        
        let passRange = 1...2
        guard passRange.contains(number) else {
            throw ReadError.outOfBound
        }
        
        return number
    }
}
