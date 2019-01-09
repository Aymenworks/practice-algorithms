//
//  SearchAlgorithmsTests.swift
//  PracticeAlgorithmsTests
//
//  Created by Rebouh Aymen on 09/01/2019.
//  Copyright © 2019 Aymen Rebouh. All rights reserved.
//

import XCTest

class SearchAlgorithmsTests: XCTestCase {

    let maxNumber = 10_000_000
    var orderedIntegers: [Int] = []
    var randomIntegers: [Int] = []
    
    override func setUp() {
        for i in 0..<maxNumber {
            orderedIntegers.append(i)
            randomIntegers.append(Int(arc4random()))
        }
    }
    
    override func tearDown() {
        orderedIntegers = []
        randomIntegers = []
    }
    
    // Linear time, that means that the search speed will depend on the input size
    // Meaning that the search algorithm become less efficient as its input size grow
    func testBruteForceSearch() {
        let numberToFind = maxNumber/2
        self.measure {
            for number in orderedIntegers {
                if number == numberToFind {
                    print("brute force found")
                    break
                }
            }
        }
    }
    
    // We know that if we are looking for 10, it doesn't make sense to search from 11 - 1000000 or 0-9
    // So the idea is to avoid ununcessary search by looking at the middle all the time
    func testBinarySearch() {
        let numberToFind = maxNumber/2
        self.measure {
            var finish = false
            var minIndex = 0
            var maxIndex = orderedIntegers.count-1
            while !finish {
                let midIndex = (minIndex+maxIndex)/2
                let middleValue = orderedIntegers[midIndex]
                
                if middleValue == numberToFind {
                    finish = true
                } else if middleValue < numberToFind {
                    minIndex = midIndex + 1
                } else {
                    maxIndex = midIndex - 1
                }
                
                if minIndex == maxIndex {
                    finish = true
                }
            }
        }
    }
}
