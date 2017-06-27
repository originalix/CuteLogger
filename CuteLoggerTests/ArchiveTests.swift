//
//  ArchiveTests.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/27.
//  Copyright © 2017年 Lix. All rights reserved.
//

import XCTest
@testable import CuteLogger

class ArchiveTests: XCTestCase {
    
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
    
    func testArchiveLogDir() {
        LogArchive.createZip(contentsOfDirectory: LogStorage.share.getCachePath())
        
        let bool = FileManager.default.fileExists(atPath: LogArchive.getArchivePath())
        
        XCTAssertTrue(bool, "压缩文件失败")
    }
    
}
