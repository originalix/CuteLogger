//
//  LogGenerator.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit

public enum DebugLevel {
    case debug
    case info
    case warning
    case error
}

public enum OperateType {
    case network
    case native
}

public class LogGenerator: NSObject {
    
    public func debug(targetClass: AnyClass, content: String, _ line: Int = #line, _ function: String = #function) {
        let log = createLog(level: .debug, targetClass: targetClass, type: .native, content: content, line, function)
        let _ = Enqueue(log: log)
    }

    public func info(targetClass: AnyClass, content: String, _ line: Int = #line, _ function: String = #function) {
        let log = createLog(level: .info, targetClass: targetClass, type: .native, content: content, line, function)
        let _ = Enqueue(log: log)
    }
    
    public func warning(targetClass: AnyClass, content: String, _ line: Int = #line, _ function: String = #function) {
        let log = createLog(level: .warning, targetClass: targetClass, type: .native, content: content, line, function)
        let _ = Enqueue(log: log)
    }
    
    public func error(targetClass: AnyClass, content: String, _ line: Int = #line, _ function: String = #function) {
        let log = createLog(level: .error, targetClass: targetClass, type: .native, content: content, line, function)
        let _ = Enqueue(log: log)
    }
    
    public func createLog(level: DebugLevel, targetClass: AnyClass, type: OperateType, content: String,  _ line: Int = #line, _ function: String = #function)
    -> String {
        let lineStr = String.init(format: "line:%d", line)
        let levelStr = levelToString(level: level)
        let separator = "|"
        let classSeparator = "_"
        let log: String = Date().toString() + separator + levelStr + separator + targetClass.className + classSeparator + function + classSeparator + lineStr + separator + content + "\n"
        print(log)
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
    
    private func Enqueue(log: String) -> Bool {
        return LogQueue.default.Enqueue(log: log)
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
