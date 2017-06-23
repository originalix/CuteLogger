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
        let log: String = Date().toString() + "|" + targetClass.className + "|" + content + "|" + function + "|"
        return log
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
