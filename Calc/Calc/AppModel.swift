//
//  AppModel.swift
//  Calc
//
//  Created by studentuser on 4/20/16.
//  Copyright © 2016 Vincent Wu. All rights reserved.
//

import Foundation

// Numbers that have been inputted
class InputtedNumbers {
    var nums : [Int]
    
    init() {
        nums = []
    }
    
    func lastNum() -> Int? {
        if nums.count >= 1 {
            return nums[nums.count - 1]
        }
        return nil;
    }
    
    func secondLastNum() -> Int? {
        if nums.count >= 2 {
            return nums[nums.count - 2]
        }
        return nil;
    }
    
    func clear() {
        nums = []
    }
}

// Operations that have been inputted
class InputtedOps {
    var ops : [String]
    
    init() {
        ops = [];
    }
    
    func lastOp() -> String? {
        return ops[ops.count - 1]
    }
    
    func clear() {
        ops = []
    }
}