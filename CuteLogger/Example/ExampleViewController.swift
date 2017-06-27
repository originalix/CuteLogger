//
//  ExampleViewController.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit
import SSZipArchive

class ExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = LogGenerator().createLog(level: .error, targetClass: self.classForCoder, type: .native, content: "this is a debug log")
        zipForPackage()
    }
    
    func testLog() {
        let _ = LogGenerator().debug(targetClass: self.classForCoder, content: "测试Log!!!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func zipForPackage() {
        var str = "压缩测试..."
        for _ in 0...100 {
            str += "压缩！！！-<<< 测试 \n"
        }
        let data = str.data(using: .utf8)
        let _ = LogStorage.share.updateFile(fileName: "test", data: data!)
        LogArchive.createZip(contentsOfDirectory: LogStorage.share.getCachePath())
    }
}
