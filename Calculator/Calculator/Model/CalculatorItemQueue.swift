//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Harry on 2023/01/24.
//

struct CalculaterItemQueue<Element: CalculateItem> {
    var queue: LinkedList<Element>
    
    mutating func enqueue(_ element: Element) {
        queue.appendLast(element)
    }
    
    mutating func dequeue() -> Element? {
        guard let element = queue.removeFirst() else { return nil }
        
        return element
    }
    
    mutating func removeAll() {
        queue.removeAll()
    }
}