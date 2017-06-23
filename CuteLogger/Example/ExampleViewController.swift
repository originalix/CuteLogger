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
//        let _ = FileTest.createFilePath(fileName: "test")
//        let log = LogGenerator().debug(targetClass: self.classForCoder, content: "测试Log!!!")
//        let data = log.data(using: .utf8)!
//        if (FileTest.writeFile(fileName: "test", data: data as NSData)) {
//            print("写入文件成功")
//        } else {
//            print("写入文件失败")
//        }
        print(FileTest.getCachePath())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
