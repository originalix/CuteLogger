//
//  LogQueue.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/26.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit

struct LQueue<T> {
    var logData = [T]()
    var front: Int
    var rear: Int
    var maxsize: Int;
}

protocol QueueProtocol {
    func createQueue()
    func traverseQueue()
    func isFullQueue() -> Bool
    func isEmptyQueue() -> Bool
    func Enqueue(log: String) -> Bool
    func Dequeue() -> Bool
}

class LogQueue: NSObject,  QueueProtocol {
    static public let `default` = LogQueue()
    private override init() {
        super.init()
        createQueue()
    }
    
    var queue: LQueue<String>!
    let maxsize: Int = 11
    
    func createQueue() {
        queue = LQueue.init(logData: Array<String>.init(repeating: "", count: maxsize), front: 0, rear: 0, maxsize: maxsize)
    }
    
    func traverseQueue() {
        var i = queue.front
        print("队列中的元素是 : \n")
        while (i % queue.maxsize != queue.rear) {
            print(" 元素\(i) = \(queue.logData[i])")
            i += 1
        }
    }
    
    func isFullQueue() -> Bool {
        if (queue.front == (queue.rear + 1) % queue.maxsize) {
            return true
        }
        
        return false
    }
    
    func isEmptyQueue() -> Bool {
        if (queue.front == queue.rear) {
            return true
        }
        
        return false
    }
    
    func getLength() -> Int {
        return (queue.rear - queue.front + queue.maxsize) % queue.maxsize
    }
    
    func Enqueue(log: String) -> Bool {
        if isFullQueue() {
            print("队列已满，插入失败 \n")
            return false
        }
        
        queue.logData[queue.rear] = log
        queue.rear = (queue.rear + 1) % queue.maxsize
        return true
    }
    
    func Dequeue() -> Bool {
        if isEmptyQueue() {
            return false
        }
        
        queue.front = (queue.front + 1) % queue.maxsize
        return true
    }
    
}
