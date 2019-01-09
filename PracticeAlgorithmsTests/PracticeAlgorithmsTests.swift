//
//  PracticeAlgorithmsTests.swift
//  PracticeAlgorithmsTests
//
//  Created by Aymen Rebouh on 2019/01/07.
//  Copyright © 2019 Aymen Rebouh. All rights reserved.
//

import XCTest
@testable import PracticeAlgorithms

class PracticeAlgorithmsTests: XCTestCase {

    var orderedIntegers: [Int] = []
    var randomIntegers: [Int] = []

    override func setUp() {
        for i in 0..<10_000 {
            orderedIntegers.append(i)
            randomIntegers.append(Int(arc4random()))
        }
    }

    override func tearDown() {
        orderedIntegers = []
        randomIntegers = []
    }

    // 0.481
    func testNativeSort() {
        self.measure {
            print("testNativeSort")
            randomIntegers.sort()
        }
    }
    
    func testBubbleSortOnRandomNumbers() {
        self.measure {
            var isSorted = true
            for i in 1..<randomIntegers.count {
                isSorted = true
                for j in stride(from: randomIntegers.count-1, to: i+1, by: -1) {
                    if randomIntegers[j] < randomIntegers[j-1] {
                        randomIntegers.swapAt(j, j-1)
                        isSorted = false
                    }
                }
                
                if isSorted {
                    return
                }
            }
        }
    }
    
    func testBubbleSortOnSortedNumbers() {
        self.measure {
            var isSorted = true
            for i in 1..<orderedIntegers.count {
                isSorted = true
                for j in stride(from: orderedIntegers.count-1, to: i+1, by: -1) {
                    if orderedIntegers[j] < orderedIntegers[j-1] {
                        orderedIntegers.swapAt(j, j-1)
                        isSorted = false
                    }
                }
                
                if isSorted {
                    return
                }
            }
        }
    }
    
    func testInsertionSortOnRandomNumbers() {
        self.measure {
            for i in 1..<randomIntegers.count {
                var j = i
                while j > 0 && randomIntegers[j] < randomIntegers[j-1] {
                    randomIntegers.swapAt(j, j-1)
                    j -= 1
                }
            }
        }
    }
    
    func testInsertionSortOnSortedNumbers() {
        self.measure {
            for i in 1..<orderedIntegers.count {
                var j = i
                while j > 0 && orderedIntegers[j] < orderedIntegers[j-1] {
                    orderedIntegers.swapAt(j, j-1)
                    j -= 1
                }
            }
        }
    }
    
    func testSelectionSortOnRandomNumbers() {
        self.measure {
            for i in 0..<randomIntegers.count {
                var indexSmallestItem = i
                for j in i+1..<randomIntegers.count {
                    if randomIntegers[j] < randomIntegers[indexSmallestItem] {
                        indexSmallestItem = j
                    }
                }
                
                if i != indexSmallestItem {
                    randomIntegers.swapAt(indexSmallestItem, i)
                }
            }
        }
    }
    
    func testSelectionSortOnOrderedNumbers() {
        self.measure {
            for i in 0..<orderedIntegers.count {
                var indexSmallestItem = i
                for j in i+1..<orderedIntegers.count {
                    if orderedIntegers[j] < orderedIntegers[indexSmallestItem] {
                        indexSmallestItem = j
                    }
                }
                
                if i != indexSmallestItem {
                    orderedIntegers.swapAt(indexSmallestItem, i)
                }
            }
        }
    }
}
