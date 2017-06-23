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
    
    public func createLog(time: Date, level: DebugLevel, class: AnyClass, type: OperateType, content: NSString) {
        
    }
}
