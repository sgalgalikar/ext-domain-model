//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}


////////////////////////////////////
// Money
//
public struct Money {
  public var amount : Int
  public var currency : String
    
  
  public func convert(_ to: String) -> Money {
    var calcAmount: Int
    switch currency {
        case "USD":
            if to == "GBP" {
                calcAmount = self.amount / 2
                return Money(amount: calcAmount, currency: "GBP")
            } else if to == "CAN" {
                calcAmount = (self.amount * 5) / 4
                return Money(amount: calcAmount, currency: "CAN")
            } else if to == "EUR" {
                calcAmount = (self.amount * 3) / 2
                return Money(amount: calcAmount, currency: "EUR")
            } else {
                return self
            }
        
        case "GBP":
            if to == "USD" {
                calcAmount = self.amount * 2
                return Money(amount: calcAmount, currency: "USD")
            } else if to == "CAN" {
                calcAmount = (self.amount * 5) / 2
                return Money(amount: calcAmount, currency: "CAN")
            } else if to == "EUR" {
                calcAmount = self.amount * 3
                return Money(amount: calcAmount, currency: "EUR")
            } else {
                return self
            }
        
        case "CAN":
            if to == "GBP" {
                calcAmount = (self.amount * 2) / 5
                return Money(amount: calcAmount, currency: "GBP")
            } else if to == "USD" {
                calcAmount = (self.amount * 4) / 5
                return Money(amount: calcAmount, currency: "USD")
            } else if to == "EUR" {
                calcAmount = (self.amount * 6) / 5
                return Money(amount: calcAmount, currency: "EUR")
            } else {
                return self
            }
        
        case "EUR":
            if to == "GBP" {
                calcAmount = self.amount  / 3
                return Money(amount: calcAmount, currency: "GBP")
            } else if to == "CAN" {
                calcAmount = (self.amount * 5) / 6
                return Money(amount: calcAmount, currency: "CAN")
            } else if to == "USD" {
                calcAmount = (self.amount * 2) / 3
                return Money(amount: calcAmount, currency: "USD")
            } else {
                return self
            }
        
        default:
            print("currency type unknown")
            return self
    }

  }
  
  public func add(_ to: Money) -> Money {
    let save =  self.convert(to.currency)
    return Money(amount: (to.amount + save.amount), currency: to.currency)
  }
  public func subtract(_ from: Money) -> Money {
    let save =  self.convert(from.currency)
    return Money(amount: (from.amount - save.amount), currency: from.currency)
  }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
    switch type {
    case .Hourly(let value):
        return Int(Double(hours) * value);
    case .Salary(let value):
        return value;
    }
  }
  
  open func raise(_ amt : Double) {
    switch type {
    case .Hourly(let value):
        self.type = Job.JobType.Hourly(amt + value);
    case .Salary(let value):
        self.type = Job.JobType.Salary(Int(amt) + value);
    }
  }
}
//
//////////////////////////////////////
//// Person
////
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0
    

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get {
        return _job
    }
    set(value) {
        if age > 16 {
            _job = value
        }
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get {
        return _spouse
    }
    set(value) {
        if age > 18 {
            _spouse = value
        }
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
    return "[Person: firstName:\(firstName) lastName:\(lastName) age:\(age) job:\(job) spouse:\(spouse)]"
  }
}

//////////////////////////////////////
//// Family
////
open class Family {
  fileprivate var members : [Person] = []
    private var isLegal : Bool = false
  
  public init(spouse1: Person, spouse2: Person) {
    if (spouse1.spouse == nil && spouse1.age > 18 && spouse2.spouse == nil && spouse2.age > 18){
        spouse1.spouse = spouse2
        spouse2.spouse = spouse1
        members.append(spouse1)
        members.append(spouse2)
        if (spouse1.age > 21 || spouse2.age > 21) {
            isLegal = true
        }
    }
  }
  
  open func haveChild(_ child: Person) -> Bool {
    if (isLegal){
       members.append(child)
        return true
    }
    return false
  }
  
  open func householdIncome() -> Int {
    var sum = 0
    for person in members{
        if person.job != nil {
            sum += (person.job?.calculateIncome(2000))!
        }
    }
    return sum
  }
}





