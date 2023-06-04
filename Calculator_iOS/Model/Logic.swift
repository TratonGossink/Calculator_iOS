//
//  Logic.swift
//  Calculator_iOS
//
//  Created by Traton Gossink on 6/1/23.
//

import Foundation

struct Logic {
    
    private var num: Double?
    
    private var intermCalc: (n1: Double, action: String)?
    
    mutating func setNum(_ number: Double?)  {
        self.num = number
    }
    
    mutating func calculate(symbol: String) -> Double?  {
        
        if let n = num {
            switch symbol {
            case "+/-":
                return n * -1
             case "AC":
                return n * 0
             case "%":
                return n * 0.01
            case "=":
                return twoNumCalc(n2: n )
            default:
                intermCalc = (n1: n, action: symbol)
            }
        }
        return nil
    }
    
    private func twoNumCalc(n2: Double) -> Double? {
        if let n1 = intermCalc?.n1, let operation = intermCalc?.action {
            
            switch operation {
            case "+":
                return  n1 + n2
            case "-":
                return  n1 - n2
            case "×":
                return  n1 * n2
            case "÷":
                if n2 != 0 {
                    return  n1 / n2
                } else {
                    print("Cannot divide by zero.")
                }
            default:
                fatalError("Triggered operation does not matach any of the cases available.")
            }
        }
        return nil
    }
}
