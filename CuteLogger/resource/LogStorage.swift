//
//  LogStorage.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit

protocol LogStorageProtocol {
    func getCachePath() -> String
//    func deleteFile(with name: String) -> Bool
//    func cleanCache() -> Bool
//    func readFile(with name: String) -> NSData?
//    func writeFile(with name:String, data: Data)
    
}

class LogStorage: NSObject, LogStorageProtocol {
    
    let CACHEPATH = "LogStorage"
    
    private override init() { }
    
    static public let share: LogStorage = LogStorage()
    
    public func getCachePath() -> String {
        var cacheDir = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        if (!cacheDir.hasSuffix("/")) {
            cacheDir += "/"
        }
        
        return cacheDir
    }
    
    private func fileManager() -> FileManager {
        return FileManager.default
    }
    
    private func createFilePath(fileName: String) -> String? {
        let cachePath = getCachePath()
        if (!dirExists(dir: cachePath) && !createDir(dir: cachePath)) {
            return nil
        }
        
        let filePath = cachePath + fileName
        if fileExists(path: filePath) {
            do {
                try fileManager().removeItem(atPath: filePath)
            } catch {
                return nil
            }
        }
        
        return filePath
    }
    
    private func createDir(dir: String) -> Bool {
        do {
            try fileManager().createDirectory(at: URL.init(fileURLWithPath: dir, isDirectory: true), withIntermediateDirectories: true, attributes: nil)
        } catch {
            return false
        }
        
        return true
    }
    
    private func fileExists(with fileName: String) -> String? {
        let cachePath = getCachePath()
        if (!dirExists(dir: cachePath)) {
            return nil
        }
        
        let filePath = cachePath + fileName
        return fileExists(path: filePath) ? filePath : nil
    }
    
    private func fileExists(path: String) -> Bool {
        return dirExists(dir: path)
    }
    
    private func dirExists(dir: String) -> Bool {
        return fileManager().fileExists(atPath: dir)
    }
    
}
