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
        
        let _ = LogGenerator().createLog(level: .error, targetClass: self.classForCoder, type: .native, content: "this is a debug log")
//        testLog()
        testFile()
    }
    
    func testLog() {
        let _ = LogGenerator().debug(targetClass: self.classForCoder, content: "测试Log!!!")
    }

    func testFile() {
//        let path = FileTest.createFilePath(fileName: "test")
//        let log = LogGenerator().debug(targetClass: self.classForCoder, content: "测试Log")
//        let data = log.data(using: .utf8)!
//        FileTest.writeFile(fileName: "test", data: data as NSData)
        for i in 0...100 {
            let str = String.init(format: "第 %d 个 Log!", i)
            let log = LogGenerator().debug(targetClass: self.classForCoder, content: str)
            let data = log.data(using: .utf8)!
            FileTest.updateFile(fileName: "test", data: data)
        }
        print(FileTest.getCachePath())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
