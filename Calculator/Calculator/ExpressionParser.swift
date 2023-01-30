//
//  ExpressionParser.swift
//  Calculator
//
//  Created by 송종환 on 2023/01/26.
//

import Foundation

enum ExpressionParser {
    
    //componentsByOperates로 변환된값이 들어오면 Formula로 분류
    static func parse(from input: String) -> Formula {
    
        var operatorArray = CalculatorItemQueue<Operator>()
        var operandArray = CalculatorItemQueue<Double>()
        
        extractOperators(from: input)
                .map {Character($0)}
                .compactMap {Operator(rawValue: $0)}
                .forEach {operatorArray.enqueueItem($0)}
               
        componentsByOperators(from: input)
                .compactMap {Double($0)}
                .forEach{ operandArray.enqueueItem($0)}
        
        return Formula(operators: operatorArray, operands: operandArray)
    }
    
    //담아오는 String을 오퍼레이터 기준으로 분류하는 매서드
    static private func componentsByOperators(from target: String) -> [String] {
        
        var resultNumber: [String] = []
        resultNumber.append(target)

        for operators in Operator.allCases {
            var curruentNumber: [String] = []

            resultNumber.forEach {
                curruentNumber += $0.split(someOperator: operators.rawValue)
            }
            
            resultNumber = curruentNumber
        }
        return resultNumber
    }
    
    //담아오는 String을 숫자기준으로 분류해 오퍼레이터를 내뱉는 매서드
    static private func extractOperators(from target: String) -> [String] {
        var resultOperators: [String] = []
        
        resultOperators = target.split(whereSeparator: {$0.isNumber || $0 == "."}).map{String($0)}
        
        return resultOperators
    }
    
}

