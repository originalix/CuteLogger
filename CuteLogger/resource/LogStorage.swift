//
//  LogStorage.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit

public protocol LogStorageProtocol {
    
    /// 获取日志缓存地址
    ///
    /// - Returns: String
    func getCachePath() -> String
    
    /// 删除文件
    ///
    /// - Parameter fileName: String
    /// - Returns: Bool
    func deleteFile(fileName: String) -> Bool
    
    /// 清除全部日志缓存
    ///
    /// - Returns: Bool
    func cleanCache() -> Bool
    
    /// 读取日志文件
    ///
    /// - Parameter fileName: String
    /// - Returns: Data
    func readFile(fileName: String) -> Data?
    
    /// 更新写入Log数据
    ///
    /// - Parameters:
    ///   - fileName: String
    ///   - data: Data
    /// - Returns: Data
    func updateFile(fileName: String, data: Data) -> Bool
    
    /// 自动根据天数创建文件名
    ///
    /// - Returns: String
    func createFileName() -> String
}

public class LogStorage: NSObject, LogStorageProtocol {
    
    let CACHEPATH = "LogStorage"
    let ARCHIVE_CACHE_PATH = "LogStorageArchive"
    let THE_WHOLE_DAY_SECONDS = 86400
    
    private override init() {
        super.init()
        print(getCachePath())
    }
    
    static public let share: LogStorage = LogStorage()
    
    public func getCachePath() -> String {
        var cacheDir = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        if (!cacheDir.hasSuffix("/")) {
            cacheDir += "/"
        }
        
        cacheDir += CACHEPATH + "/"
        
        return cacheDir
    }
    
    private func fileManager() -> FileManager {
        return FileManager.default
    }
    
    public func createFileName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let fileName = dateFormatter.string(from: Date()) + ".txt"
        
        return fileName
    }
    
    public func deleteFile(fileName: String) -> Bool {
        guard let filePath = fileExists(fileName: fileName) else {
            return true
        }

        return deleteFile(path: filePath)
    }
    
    public func cleanCache() -> Bool {
        let cachePath = getCachePath()
        
        if !dirExists(dir: cachePath) {
            return true
        }
        
        do {
            try fileManager().removeItem(atPath: cachePath)
        } catch {
            return false
        }
        
        return true
    }
    
    private func deleteFile(path: String) -> Bool {
        if (!fileExists(path: path)) {
            return true
        }
        do {
            try fileManager().removeItem(atPath: path)
        } catch {
            return false
        }
        
        return true
    }
    
    public func readFile(fileName: String) -> Data? {
        guard let filePath = fileExists(fileName: fileName) else {
            return nil
        }
        
        return readFileFromCache(path: filePath)
    }
    
    private func readFileFromCache(path: String) -> Data? {
        var result: Data?
        
        do {
            result = try Data.init(contentsOf: URL.init(fileURLWithPath: path), options: .uncached)
        } catch {
            return nil
        }
        
        return result
    }
    
    public func updateFile(fileName: String, data: Data) -> Bool {
        guard let filePath = fileExists(fileName: fileName) else {
            let _ = createFilePath(fileName: fileName)
            return writeFile(fileName: fileName, data: data)
        }
        
        let fileHandle: FileHandle = FileHandle.init(forUpdatingAtPath: filePath)!
        fileHandle.seekToEndOfFile()
        fileHandle.write(data)
        fileHandle.closeFile()
        return true
    }
    
    private func writeFile(fileName: String, data: Data) -> Bool {
        guard let filePath = createFilePath(fileName: fileName) else {
            return false
        }
        
        do {
            try data.write(to: URL.init(fileURLWithPath: filePath))
        } catch {
            return false
        }
        
        return true
    }
    
    private func createFilePath(fileName: String) -> String? {
        let cachePath = getCachePath()
        if (!dirExists(dir: cachePath) && !createDir(dir: cachePath)) {
            return nil
        }
        
        if fileName.characters.count < 1 {
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
    
    private func fileExists(fileName: String) -> String? {
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
    
    public func getArchivePath() -> String {
        var cacheDir = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        if (!cacheDir.hasSuffix("/")) {
            cacheDir += "/"
        }
        
        return cacheDir
    }
    
    public func deleteOverDueLog() {
        let path = getCachePath()
        do {
            let listArray = try fileManager().contentsOfDirectory(atPath: path)
            let shouldDeleteList = self.shouleDeleteFileList(fileList: listArray)
            for fileName in shouldDeleteList {
                let _ = self.deleteFile(fileName: fileName)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func shouleDeleteFileList(fileList: [String]) -> [String] {
        var shouldDeleteList: [String] = []
        for fileName in fileList {
            if (fileName.range(of: ".") != nil) {
                let fileSimpleName = fileName.components(separatedBy: ".").first
                if let fileDate = fileSimpleName {
                    if (checkFileIsOverDue(date: fileDate)) {
                        shouldDeleteList.append(fileName)
                    }
                    print(fileDate)
                }
            }
        }
        return shouldDeleteList
    }
    
    private func checkFileIsOverDue(date: String) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let fileDate: Date = formatter.date(from: date)!
        let fileTimestamp = fileDate.timeIntervalSince1970
        let nowTimestamp = Date().timeIntervalSince1970
        if ((Int)(nowTimestamp - fileTimestamp) > THE_WHOLE_DAY_SECONDS * 7) {
            return true
        }
        return false
    }
    
}
