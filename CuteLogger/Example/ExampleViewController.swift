//
//  ExampleViewController.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let log = LogGenerator().createLog(level: .error, targetClass: self.classForCoder, type: .native, content: "this is a debug log")
        print(log)
        testLog()
    }
    
    func testLog() {
//        let log = LogGenerator().createLog(level: .debug, targetClass: self.classForCoder, type: .native, content: "测试Log 查看nil情况", function: #function, line: #line)
//        print(log)
        let debug = LogGenerator().debug(targetClass: self.classForCoder, content: "测试Log!!!")
        print(debug)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
