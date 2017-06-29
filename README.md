# CuteLogger

> 一个由Swift编写而成的自定义日志系统。

## Installing

```bash
source 'git@git.lnts.cn:lixiao/LNSpecs.git'
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
use_frameworks!

target 'Demo' do
    pod 'CuteLog'
end

```

## Usage

1. `LogGenerator` 日志Log生成类
2. `LogQueue` 存储Log的循环队列类
3. `LogArchive` 压缩Log文件类

## Example

In Swift: 

```swift
LogGenerator().debug(targetClass: self.classForCoder, content: "测试Log")
LogGenerator().warning(targetClass: self.classForCoder, content: "测试Log")
LogGenerator().info(targetClass: self.classForCoder, content: "测试Log")
LogGenerator().error(targetClass: self.classForCoder, content: "测试Log")
```

In Objective-C:

```Objc
Cute_Debug(@"这是一个Debug - Log")
Cute_Info(@"这是一个info - Log")
Cute_Error(@"这是一个Error - Log")
Cute_Warning(@"这是一个 Warning - Log")
```
