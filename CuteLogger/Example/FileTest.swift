//
//  FileTest.swift
//  CuteLogger
//
//  Created by Lix on 2017/6/23.
//  Copyright © 2017年 Lix. All rights reserved.
//

import UIKit

//第一层文件夹名称
let CACHEPATH = "K12Cache"

//内层文件夹名称
let MarkingPath = "K12Cache/Marking/"

class FileTest: NSObject {
    
    //缓存路径(这里用的沙盒cache文件，非document，可根据需求更改)
    class func getCachePath()->String{
        var cacheDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, .userDomainMask, true).first!
        if(!cacheDir.hasSuffix("/")){
            cacheDir += "/"
        }
        cacheDir += CACHEPATH + "/"
        return cacheDir
    }
    
    //获得NSFileManager
    class func getFileManager()->FileManager{
        return FileManager.default
    }
    
    //判断文件夹是否存在
    class func dirExists(dir:String)->Bool{
        return getFileManager().fileExists(atPath: dir)
    }
    
    //判断文件是否存在
    class func fileExists(path:String)->Bool{
        return dirExists(dir: path)
    }
    
    //判断是否存在,存在则返回文件路径，不存在则返回nil
    class func fileExistsWithFileName(fileName:String)->String?{
        let dir = getCachePath()
        if(!dirExists(dir: dir)){
            return nil
        }
        let filePath = dir + fileName
        
        return fileExists(path: filePath) ? filePath : nil
    }
    
    //创建文件夹
    class func createDir(dir:String)->Bool{
        let fileManager = getFileManager()
        do{
            try fileManager.createDirectory(at: NSURL(fileURLWithPath: dir, isDirectory: true) as URL, withIntermediateDirectories: true, attributes: nil)
        }catch{
            return false
        }
        return true
    }
    
    /// 根据文件名创建路径
    ///
    /// - Parameter fileName: <#fileName description#>
    /// - Returns: <#return value description#>
    class func createFilePath(fileName:String)->String?{
        let dir = getCachePath()
        if(!dirExists(dir: dir) && !createDir(dir: dir)){
            return nil
        }
        let filePath = dir + fileName
        if(fileExists(path: filePath)){
            do{
                try getFileManager().removeItem(atPath: filePath)
            }catch{
                return nil
            }
            
        }
        return filePath
    }
    
    
    /// 删除文件 - 根据文件名称
    ///
    /// - Parameter fileName: <#fileName description#>
    /// - Returns: <#return value description#>
    class func deleteFileWithName(fileName:String)->Bool{
        guard let filePath = fileExistsWithFileName(fileName: fileName) else{
            return true
        }
        return deleteFile(path: filePath)
    }
    
    
    /// 删除文件 - 根据文件路径
    ///
    /// - Parameter path: <#path description#>
    /// - Returns: <#return value description#>
    class func deleteFile(path:String)->Bool{
        if(!fileExists(path: path)){
            return true
        }
        let fileManager = getFileManager()
        do{
            try fileManager.removeItem(atPath: path)
        }catch{
            return false
        }
        
        return true
    }
    
    /**
     清除所有的缓存
     
     - returns: Bool
     */
    class func deleteAll()->Bool{
        let dir = getCachePath()
        
        if !dirExists(dir: dir){
            return true
        }
        let manager = getFileManager()
        do{
            try manager.removeItem(atPath: dir)
        }catch{
            return false
        }
        return true
    }
    
    //读取文件 -（根据路径）
    class func readFileFromCache(path:String)->NSData?{
        var result:NSData?
        do{
            result = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.uncached)
        }catch{
            return nil
        }
        return result
    }
    
    //读取文件 -（根据文件名）
    class func readFile(fileName:String)->NSData?{
        
        guard let filePath = fileExistsWithFileName(fileName: fileName) else{
            return nil
        }
        
        return readFileFromCache(path: filePath)
    }
    
    
    
    /// 写文件
    ///
    /// - Parameters:
    ///   - fileName: 文件名称
    ///   - data: 数据data
    /// - Returns: bool
    class func writeFile(fileName:String,data:NSData)->Bool{
        
        guard let filePath = createFilePath(fileName: fileName) else{
            return false
        }
        
        return data.write(toFile: filePath, atomically: true)
    }
    
    class func updateFile(fileName: String, data: Data){
        
        guard let filePath = fileExistsWithFileName(fileName: fileName) else {
            let _ = createFilePath(fileName: fileName)
            let _ = writeFile(fileName: fileName, data: data as NSData)
            return
        }
        
        let fileHandle: FileHandle = FileHandle.init(forUpdatingAtPath: filePath)!
        fileHandle.seekToEndOfFile()
        fileHandle.write(data)
        fileHandle.closeFile()
    }

}
