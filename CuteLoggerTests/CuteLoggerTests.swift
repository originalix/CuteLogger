//
//  CuteLoggerTests.swift
//  CuteLoggerTests
//
//  Created by Lix on 2017/6/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import XCTest
@testable import CuteLogger

class CuteLoggerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
    func testGetCachePath() {
        let path: String = LogStorage.share.getCachePath()
        XCTAssertTrue(path != nil, "获取缓存路径失败")
    }
    
}
