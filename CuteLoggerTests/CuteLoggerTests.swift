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
    
//    func testGetCachePath() {
//        let path: String = LogStorage.share.getCachePath()
//        XCTAssertTrue(path.characters.count > 0, "获取缓存路径失败")
//    }
//    
//    func testCreateDir() {
//        let filePath = LogStorage.share.getCachePath() + "testDir"
//        let bool = LogStorage.share.createDir(dir: filePath)
//        XCTAssertTrue(bool, "创建文件夹失败")
//    }
//    
//    func testDirExists() {
//        let filePath = LogStorage.share.getCachePath() + "testDir"
//        let bool = LogStorage.share.dirExists(dir: filePath)
//        XCTAssertTrue(bool, "查询文件存在状态函数无效")
//    }
//    
//    func testFileExists() {
//        let filePath = LogStorage.share.getCachePath() + "testDir"
//        let bool = LogStorage.share.fileExists(path: filePath)
//        XCTAssertTrue(bool, "查询文件存在状态函数无效")
//    }
//    
//    func testFileExistsWithFileName() {
//        let fileName = "testDir"
//        let filePath = LogStorage.share.fileExists(fileName: fileName)
//        XCTAssertTrue(filePath != nil, "根据文件名查询文件状态失败")
//    }
//    
//    func testCreateFilePath() {
//        let fileName = "t"
//        let filePath = LogStorage.share.createFilePath(fileName: fileName)
//        XCTAssertTrue(filePath != nil, "创建文件路径失败")
//    }
//    
//    func testWriteFile() {
//        let str = "这是一个测试的Data"
//        let data = str.data(using: .utf8)
//        let bool = LogStorage.share.writeFile(fileName: "wsx", data: data!)
//        XCTAssertTrue(bool, "写入文件失败")
//    }
//    
//    func testReadFile() {
//        let filePath = LogStorage.share.getCachePath() + "wsx"
//        let data = LogStorage.share.readFileFromCache(path: filePath)
//        let str = String.init(data: data!, encoding: .utf8)
//        XCTAssertTrue((str?.characters.count)! > 0, "读取文件失败")
//    }
//    
//    func testReadFileWithName() {
//        let data = LogStorage.share.readFile(fileName: "wsx")
//        let str = String.init(data: data!, encoding: .utf8)
//        XCTAssertTrue((str?.characters.count)! > 0, "读取文件失败")
//    }
//    
//    func testDeleteFileWithPath() {
//        let str = "这是一个测试的Data"
//        let data = str.data(using: .utf8)
//        let _ = LogStorage.share.writeFile(fileName: "123", data: data!)
//        let filePath = LogStorage.share.getCachePath() + "123"
//        let bool = LogStorage.share.deleteFile(path: filePath)
//        XCTAssertTrue(bool, "根据路径删除文件失败")
//    }
//    
//    func testDeleteFile() {
//        let str = "这!!!!!!!!!"
//        let data = str.data(using: .utf8)
//        let _ = LogStorage.share.writeFile(fileName: "deleteFile", data: data!)
//        let bool = LogStorage.share.deleteFile(fileName: "deleteFile")
//        XCTAssertTrue(bool, "根据文件名删除文件失败")
//    }
//    
////    func testCleanCache() {
////        let bool = LogStorage.share.cleanCache()
////        XCTAssertTrue(bool, "清除缓存成功")
////    }
//    
//    func testUpdateFile() {
//        let str = "this is a test page................."
//        let data = str.data(using: .utf8)
//        let bool = LogStorage.share.updateFile(fileName: "tttfile", data: data!)
//        XCTAssertTrue(bool, "更新文件失败")
//    }
    
    func testCreateFileName() {
        let fileName = LogStorage.share.createFileName()
        XCTAssertTrue(fileName == "2017-06-27", "创建文件名有误")
    }
    
    func testLogInfo() {
        let _ = LogStorage.share.cleanCache()
        for i in 0...300 {
            let content = String.init(format: "这是一个info Log  +  %d", i)
            let _ = LogGenerator().error(targetClass: self.classForCoder, content: content)
        }
        let bool = LogQueue.default.isEmptyQueue()
        XCTAssertTrue(!bool, "当前队列错误")
    }
}
