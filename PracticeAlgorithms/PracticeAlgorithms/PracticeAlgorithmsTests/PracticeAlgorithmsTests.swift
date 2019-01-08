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
        for i in 0..<20_000 {
            orderedIntegers.append(i)
            randomIntegers.append(Int(arc4random()))
        }
    }

    override func tearDown() {
        orderedIntegers = []
        randomIntegers = []
    }


//    // Linear time, that means that the search speed will depend on the input size
//    // Meaning that the search algorithm become less efficient as its input size grow
//    func testBruteForceSearch() {
//        let numberToFind = 5_000_000
//        self.measure {
//            for number in orderedIntegers {
//                if number == numberToFind {
//                    print("brute force found")
//                    break
//                }
//            }
//        }
//    }
//
//    // We know that if we are looking for 10, it doesn't make sense to search from 11 - 1000000 or 0-9
//    // So the idea is to avoid ununcessary search by looking at the middle all the time
//    func testBinarySearch() {
//        let numberToFind = 5_000_000
//        self.measure {
//            var finish = false
//            var minIndex = 0
//            var maxIndex = orderedIntegers.count-1
//            while !finish {
//                let midIndex = (minIndex+maxIndex)/2
//                let middleValue = orderedIntegers[midIndex]
//
//                if middleValue == numberToFind {
//                    finish = true
//                } else if middleValue < numberToFind {
//                    minIndex = midIndex + 1
//                } else {
//                    maxIndex = midIndex - 1
//                }
//
//                if minIndex == maxIndex {
//                    finish = true
//                }
//            }
//        }
//    }
//
    // 0.481
    func testNativeSort() {
        self.measure {
            print("testNativeSort")
            randomIntegers.sort()
        }
    }
    
    // 3.280
    func testBubbleSort() {
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
    
    // 1.369
    func testInsertionSort() {
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
}
