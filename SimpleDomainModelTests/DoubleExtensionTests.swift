//
//  DoubleExtensionTests.swift
//  SimpleDomainModel
//
//  Created by Sanjana Galgalikar on 10/18/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//


import XCTest

import SimpleDomainModel

//////////////////
// DoubleExtensionTests
//
class DoubleExtensionTests: XCTestCase {
    
    func testUSD() {
        let fiveUSD = 5.0
        let moneyConversion = fiveUSD.USD
        XCTAssert(moneyConversion.amount == 5)
        XCTAssert(moneyConversion.currency == "USD")
    }
    
    func testGBP() {
        let fiveGBP = 5.0
        let moneyConversion = fiveGBP.GBP
        XCTAssert(moneyConversion.amount == 5)
        XCTAssert(moneyConversion.currency == "GBP")
    }
    
    func testYEN() {
        let fiveYEN = 5.0
        let moneyConversion = fiveYEN.YEN
        XCTAssert(moneyConversion.amount == 5)
        XCTAssert(moneyConversion.currency == "YEN")
    }
    
    
}
