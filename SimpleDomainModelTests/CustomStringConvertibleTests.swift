//
//  CustomStringConvertibleTests.swift
//  SimpleDomainModel
//
//  Created by Sanjana Galgalikar on 10/18/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//


import XCTest

import SimpleDomainModel

//////////////////
// CustomStringConvertibleTests
//
class CustomStringConvertibleTests: XCTestCase {
    let oneUSD = Money(amount: 1, currency: "USD")
    let thirtyEUR = Money(amount: 30, currency: "EUR")
  
    func testMoneyString() {
        XCTAssert(oneUSD.description == "USD1.0")
        XCTAssert(thirtyEUR.description == "EUR30.0")
    }
    
    func testJobString(){
        let job = Job(title: "Barista", type: Job.JobType.Hourly(25.0))
        XCTAssert(job.description == "Barista 25.0 per hour")
        
        let job2 = Job(title: "Programmer", type: Job.JobType.Salary(150000))
        XCTAssert(job2.description == "Programmer 150000 per year")
    }
    
    func testPersonString() {
        let person = Person(firstName: "Sanjana", lastName: "Galgalikar", age: 21)
        XCTAssert(person.description == "name:Sanjana lastName:Galgalikar age:21 job:nil spouse:nil")
    }
    
    func testFamilyString() {
        let person = Person(firstName: "Sanjana", lastName: "Galgalikar", age: 21)
        
        let person2 = Person(firstName: "Zac", lastName: "Efron", age: 28)
        
        person2.job = Job(title: "Actor", type: Job.JobType.Salary(500000))
        let family = Family(spouse1: person, spouse2: person2)
        XCTAssert(family.description == "Sanjana Galgalikar Zac Efron 500000")
        
    }
    
}


