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
    
}
