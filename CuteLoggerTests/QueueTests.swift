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
    
    func testCreateQueue() {
        LogQueue.default.createQueue()
        let bool = LogQueue.default.queue.maxsize == 11
        XCTAssertTrue(bool, "创建队列失败")
    }
    
    func testGetLength() {
        let length = LogQueue.default.getLength()
        let bool = length == 10
        XCTAssertTrue(bool, "队列长度获取失败")
    }
    
    func testEnqueue() {
        var result: Bool!
        let str = "测试数据"
        for i in 0...9 {
            result = LogQueue.default.Enqueue(log: String.init(format: "%@ + %d", str, i))
        }
        XCTAssertTrue(result, "插入数据失败")
    }
    
}
