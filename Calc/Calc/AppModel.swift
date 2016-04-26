//
//  AppModel.swift
//  Calc
//
//  Created by studentuser on 4/20/16.
//  Copyright © 2016 Vincent Wu. All rights reserved.
//

import Foundation

// Numbers that have been inputted
class Inputs {
    var presses : [String]
    var nums : [Double]
    var lastOp : String
    var history : [String]
    
    init() {
        presses = []
        nums = []
        lastOp = ""
        history = []
    }
    
    func checkPrevDbl() -> Bool {
        if presses.count >= 1 {
            let prev = presses[presses.count - 1]
            
            if Int(prev) != nil || prev == "." {
                return true
            }
        }
        return false
    }
    
    func clear() {
        presses = []
        nums = []
    }
    
    func secondLastNum() -> Double? {
        if nums.count >= 2 {
            return nums[nums.count - 2]
        }
        return nil
    }
    
    func lastNum() -> Double? {
        if nums.count >= 1 {
            return nums[nums.count - 1]
        }
        return nil
    }
    
    func sum() -> Double {
        var total = 0.0
        for n in nums {
            total = total + n
        }
        
        return total
    }
    
    func fact() -> Double {
        var total = 1
        for i in 1...Int(nums[nums.count - 1]) {
            total = total * i
        }
        
        return Double(total)
    }
}

//// Operations that have been inputted
//class InputtedOps {
//    var ops : [String]
//    
//    init() {
//        ops = [];
//    }
//    
//    func lastOp() -> String {
//        if ops.count >= 1 {
//            return ops[ops.count - 1]
//        }
//        return ""
//    }
//    
//    func clear() {
//        ops = []
//    }
//    
//    func saveLast(o : String?) {
//        ops = [o!]
//    }
//}