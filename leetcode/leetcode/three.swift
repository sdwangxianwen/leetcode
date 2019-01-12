//
//  three.swift
//  leetcode
//
//  Created by 王文文 on 2019/1/12.
//  Copyright © 2019年 wangwen. All rights reserved.
//https://leetcode.com/problems/longest-substring-without-repeating-characters/
//没有重复字符的最长子串

import UIKit

class three: NSObject {

   static func lengthOfLongestSubstring(_ s: String) -> Int {
        var longest = 0
        var m = 0
        var index = [Int](repeating: 0, count: 128)
        s.cString(using: .ascii)?.enumerated().forEach({ (i,c) in
            guard c != 0 else { return }
            m = max(index[Int(c)], m)
            longest = max(longest, i - m + 1)
            index[Int(c)] = i + 1
        })
        return longest
    }

    // 4 。两个排序数组的中位数
//    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double  {
//
//    }
    
    //5 。最长的回文子串
    
    func longestPalindrome(_ s: String) -> String  {
        var lo = 0
        var maxlen = 0
        let len = s.count
        if len < 2 {
            return s
        }
        
        func extendPalindrome(_ s: String, l: Int, r: Int) {
            var chars = s.utf8CString
            var l = l
            var r = r
            while l >= 0 && r < s.count && chars[l] == chars[r] {
                l -= 1
                r += 1
            }
            if maxlen < r - l - 1 {
                lo = l + 1
                maxlen = r - 1 - l
            }
        }
        s.enumerated().forEach { (i,c) in
            extendPalindrome(s, l: i, r: i)
            extendPalindrome(s, l: i, r: i + 1)
        }
        let lindex = s.index(s.startIndex, offsetBy: lo)
        let rindex = s.index(s.startIndex, offsetBy: lo + maxlen)
        return String(s[lindex..<rindex])
        
    }
    
    //6ZigZag转换
    
   static func convert(_ s: String, _ numRows: Int) -> String  {
        if numRows <= 1 || numRows > s.count {  //如果行数为1或者行数大于字符创长度，返回原字符串
            return s
        }
        var r = [String]() //定义一个数组
        var row = 0  //定义一个行数
        var setup = 1 //行数的递减
    //遍历字符串
        for (_, char) in s.enumerated() {
            if row == numRows - 1 {
                setup = -1
            }
            if row == 0 {
                setup = 1
            }
            if  row > r.count - 1 {
                r.append("\(char)")
            } else {
                r[row].append(char)
            }
            row += setup
        }
        var result = ""
        var i = 0
        while i < numRows {
            result.append(r[i])
            i += 1
        }
        return result
        
    }
    
    //7 反向整数
    
   static func reverse(_ x: Int) -> Int {
        var isBelowZero = 1
        var num = x
        if x < 0 {
            isBelowZero = -1
            num = -x
        }
        
        var result = 0
        while num > 0 {
            if result > (Int(Int32.max) - num % 10) / 10 {
                return 0
            }
            result = result * 10 + num % 10
            num = num / 10
        }
        
        return result * isBelowZero
    }
    
}
