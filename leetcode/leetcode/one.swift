//
//  one.swift
//  leetcode
//
//  Created by 王文文 on 2019/1/12.
//  Copyright © 2019年 wangwen. All rights reserved.
// https://leetcode.com/problems/two-sum/

import UIKit

class one: NSObject {
  
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0..<nums.count {
            let temp = target - nums[i]
            if let index = dict[temp]{
                return [index,i]
            }
            dict[nums[i]] = i
        }
        return []
    }
    
    func twosun0(_ nums: [Int],_ target: Int) -> [Int] {
        for (i,item0) in nums.enumerated() {
            for (j,item1) in nums.enumerated() {
                if item0 + item1 == target  {
                    return [i + 1,j + 1]
                }
            }
        }
        return []
    }
    
}
