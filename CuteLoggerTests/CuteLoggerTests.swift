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
        XCTAssertTrue(path.characters.count > 0, "获取缓存路径失败")
    }
    
    func testCreateDir() {
        let filePath = LogStorage.share.getCachePath() + "testDir"
        let bool = LogStorage.share.createDir(dir: filePath)
        XCTAssertTrue(bool, "创建文件夹失败")
    }
    
    
    
}
