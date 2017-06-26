//
//  LogQueue.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/26.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit

struct LQueue {
    var log: String
    var front: Int
    var rear: Int
    var maxsize: Int;
}

protocol QueueProtocol {
    func createQueue(queue: LQueue, maxsize: Int)
    func traverseQueue(queue: LQueue)
    func isFullQueue(queue: LQueue) -> Bool
    func isEmptyQueue(queue: LQueue) -> Bool
    func enqueue(queue: LQueue, log: String) -> Bool
    func dequeue(queue: LQueue) -> Bool
}

class LogQueue: NSObject {

}
