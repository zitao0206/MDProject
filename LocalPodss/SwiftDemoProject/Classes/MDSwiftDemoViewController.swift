//
//  Test.swift
//  MDProject
//
//  Created by Leon0206 on 2021/8/18.
//  Copyright © 2021 Leon0206. All rights reserved.
//

import Foundation
@objc(MDOCSwiftDemoViewController)
@objcMembers
public class MDSwiftDemoViewController : UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        let nums:[Int] = [2,7,11,15]
        let target = 26
        let results = twoSum(nums, target)
        print(results)
    }
    func show() {
        print("hello swift...")
    }
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let n = nums.count
        var results = [Int]()
        for (i,value)  in nums.enumerated() {
            for j in i+1...n-1 {
                if value + nums[j] == target {
                    results.append(i)
                    results.append(j)
                    return results
                }
            }
        }
        results.append(0)
        return results
    }
}
