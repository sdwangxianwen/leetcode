//
//  two.swift
//  leetcode
//
//  Created by 王文文 on 2019/1/12.
//  Copyright © 2019年 wangwen. All rights reserved.
// https://leetcode.com/problems/add-two-numbers/
//您将获得两个非空链表，表示两个非负整数。数字以相反的顺序存储，每个节点包含一个数字。添加两个数字并将其作为链接列表返回。

//您可以假设这两个数字不包含任何前导零，除了数字0本身。
//
//例：
//
//输入：（2  - > 4  - > 3）+（5  - > 6  - > 4）
//输出： 7  - > 0  - > 8
//说明： 342 + 465 = 807。

//不会

import UIKit

class ListNode: CustomDebugStringConvertible {
    
    var value: Int = 0
    var next: ListNode?
    
    init(_ value: Int = 0, _ next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
    
    var debugDescription: String {
        var s = "\(value)"
        var p = self
        while p.next != nil {
            p = p.next!
            s = "\(s) \(p.value)"
        }
        return s
    }
    
}

class two: NSObject {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var x:ListNode? = l1
        var y:ListNode? = l2
        let dummy = ListNode()
        var current = dummy
        var sum = 0
        while x != nil || y != nil {
            sum /= 10
            if let _ = x {
                sum += x!.value
                x = x!.next
            }
            if let _ = y {
                sum += y!.value
                y = y!.next
            }
            current.next = ListNode(sum % 10)
            current = current.next!
        }
        if sum / 10 > 0 {
            current.next = ListNode(1)
        }
        return dummy.next!
    }
    

}
