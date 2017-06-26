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
    
    func testDirExists() {
        let filePath = LogStorage.share.getCachePath() + "testDir"
        let bool = LogStorage.share.dirExists(dir: filePath)
        XCTAssertTrue(bool, "查询文件存在状态函数无效")
    }
    
    func testFileExists() {
        let filePath = LogStorage.share.getCachePath() + "testDir"
        let bool = LogStorage.share.fileExists(path: filePath)
        XCTAssertTrue(bool, "查询文件存在状态函数无效")
    }
    
    func testFileExistsWithFileName() {
        let fileName = "testDir"
        let filePath = LogStorage.share.fileExists(fileName: fileName)
        XCTAssertTrue(filePath != nil, "根据文件名查询文件状态失败")
    }
    
    func testCreateFilePath() {
        let fileName = "t"
        let filePath = LogStorage.share.createFilePath(fileName: fileName)
        XCTAssertTrue(filePath != nil, "创建文件路径失败")
    }
    
    func testWriteFile() {
        let str = "这是一个测试的Data"
        let data = str.data(using: .utf8)
        let bool = LogStorage.share.writeFile(fileName: "wsx", data: data!)
        XCTAssertTrue(bool, "写入文件失败")
    }
    
    func testReadFile() {
        let filePath = LogStorage.share.getCachePath() + "wsx"
        let data = LogStorage.share.readFileFromCache(path: filePath)
        let str = String.init(data: data!, encoding: .utf8)
        XCTAssertTrue((str?.characters.count)! > 0, "读取文件失败")
    }
    
}
