//
//  LogGenerator.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit

enum DebugLevel {
    case debug
    case info
    case warning
    case error
}

enum OperateType {
    case network
    case native
}

class LogGenerator: NSObject {
    
    public func createLog(level: DebugLevel, targetClass: AnyClass, type: OperateType, content: String, function: String, line: Int)
    -> String {
        let lineStr = String.init(format: "line:%d", line)
        let levelStr = levelToString(level: level)
        let separator = "|"
        let log: String = Date().toString() + separator + levelStr + separator + targetClass.className + separator + function + separator + lineStr + separator + content
        return log
    }
    
    private func levelToString(level: DebugLevel) -> String {
        var levelStr = "Debug"
        switch level {
            case .debug:
                levelStr = "Debug"
            case .info:
                levelStr = "Info"
            case .warning:
                levelStr = "Warning"
            case .error:
                levelStr = "Error"
        }
        return levelStr
    }
}

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}

extension NSObject {
    var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
    
    class var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}
