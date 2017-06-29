//
//  LogArchive.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/27.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit
import SSZipArchive

public class LogArchive: NSObject {
    class public func createZip(contentsOfDirectory: String) {
        let path = LogStorage.share.getArchivePath() + "LogStorage.zip"
        SSZipArchive.createZipFile(atPath: path, withContentsOfDirectory: contentsOfDirectory)
    }
    
    class public func getArchivePath() -> String {
        let path = LogStorage.share.getArchivePath() + "LogStorage.zip"
        return path
    }
}
