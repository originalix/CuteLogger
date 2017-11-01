Pod::Spec.new do |s|
  s.name         = "CuteLog"
  s.version      = "0.0.6"
  s.summary      = "一个由Swift编写而成的自定义日志系统"
  s.homepage     = "https://github.com/originalix/CuteLogger"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Leon" => "xiao.liunit@gmail.com" }
  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/originalix/CuteLogger.git", :tag => "#{s.version}" }
  s.source_files  = "resource", "CuteLogger/resource/*.{h,m,swift}"
  s.frameworks = "Foundation", "UIKit"
  s.dependency 'SSZipArchive', '~> 1.8.1'
end
