//
//  QueueTests.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/26.
//  Copyright © 2017年 Lix. All rights reserved.
//

import XCTest
@testable import CuteLogger

class QueueTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
//    func testCreateQueue() {
//        LogQueue.default.createQueue()
//        let bool = LogQueue.default.queue.maxsize == 11
//        XCTAssertTrue(bool, "创建队列失败")
//    }
//    
//    func testGetLength() {
//        let length = LogQueue.default.getLength()
//        let bool = length == 10
//        XCTAssertTrue(bool, "队列长度获取失败")
//    }
//    
//    func testEnqueue() {
//        var result: Bool!
//        let str = "测试数据"
//        for i in 0...9 {
//            result = LogQueue.default.Enqueue(log: String.init(format: "%@ + %d", str, i))
//        }
//        XCTAssertTrue(result, "插入数据失败")
//    }
//    
//    func testIsFullQueue() {
//        let bool = LogQueue.default.isFullQueue()
//        XCTAssertTrue(bool, "当前队列溢出函数错误")
//    }
//    
//    func testIsEmptyQueue() {
//        let bool = LogQueue.default.isEmptyQueue()
//        XCTAssertTrue(!bool, "当前是空队列函数错误")
//    }
//    
//    func testDequeue() {
//        var result: Bool!
//        let str = "测试数据"
//        for i in 0...9 {
//            let _ = LogQueue.default.Enqueue(log: String.init(format: "%@ + %d", str, i))
//        }
//        
//        for _ in 0...5 {
//            result = LogQueue.default.Dequeue()
//        }
//        
//        XCTAssertTrue(result, "弹出队列失败")
//    }
//    
//    func testUpdateToFile() {
//        for i in 0...9 {
//            let content = String.init(format: "这是一个测试日志 ~ 第%d条", i)
//            let log = LogGenerator().createLog(level: .debug, targetClass: self.classForCoder, type: .native, content: content)
//            let _ = LogQueue.default.Enqueue(log: log)
//        }
//        
//        LogQueue.default.updateFileWhenTranverse()
//        
//        for i in 10...19 {
//            let content = String.init(format: "这是一个测试日志 ~ 第%d条", i)
//            let log = LogGenerator().createLog(level: .debug, targetClass: self.classForCoder, type: .native, content: content)
//            let _ = LogQueue.default.Enqueue(log: log)
//        }
//        
//        LogQueue.default.updateFileWhenTranverse()
//        
//        let bool = LogQueue.default.isEmptyQueue()
//        XCTAssertTrue(bool, "更新文件失败")
//    }
    
    func testWriteToFileNotLimit() {
        var result = true
        for i in 200...300 {
            let content = String.init(format: "这是一个测试日志 ~ 第%d条", i)
            let log = LogGenerator().createLog(level: .debug, targetClass: self.classForCoder, type: .native, content: content)
            result = LogQueue.default.Enqueue(log: log)
        }
        
        XCTAssertTrue(result, "更新文件失败")
    }
}
