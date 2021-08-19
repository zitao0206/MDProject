//
//  Test.swift
//  MDProject
//
//  Created by Leon0206 on 2021/8/18.
//  Copyright © 2021 Leon0206. All rights reserved.
//

import Foundation
//@objc(MDOCSwiftDemoViewController)
@objcMembers
public class MDSwiftDemoViewController : UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
    }
    func show() {
        print("hello swift...")
    }
}
