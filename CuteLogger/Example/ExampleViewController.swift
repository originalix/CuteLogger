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
        
        let log = LogGenerator().createLog(level: .error, targetClass: self.classForCoder, type: .native, content: "this is a debug log", function: #function, line: #line)
        print(log)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
