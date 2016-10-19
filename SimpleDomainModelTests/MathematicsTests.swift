//
//  MathematicsTests.swift
//  SimpleDomainModel
//
//  Created by Sanjana Galgalikar on 10/18/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//


import XCTest

import SimpleDomainModel

//////////////////
// MathematicsTests
//
class MathematicsTests: XCTestCase {
    
    let tenUSD = Money(amount: 10, currency: "USD")
    let twelveUSD = Money(amount: 12, currency: "USD")
    
    
    func testAddUSDTogether() {
        let sum = tenUSD + twelveUSD
        XCTAssert(sum.amount == 22)
        XCTAssert(sum.currency == "USD")
    }
    
    func testSubtractUSDTogether() {
        let sum =  twelveUSD - tenUSD
        XCTAssert(sum.amount == 2)
        XCTAssert(sum.currency == "USD")
    }
    
    
}
