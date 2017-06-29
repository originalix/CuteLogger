Pod::Spec.new do |s|
  s.name         = "CuteLog"
  s.version      = "0.0.2"
  s.summary      = "一个由Swift编写而成的自定义日志系统"
  s.homepage     = "http://git.lnts.cn/"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "lnts" => "app@lnts.cn" }
  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.source       = { :git => "git@git.lnts.cn:lixiao/CuteLogger.git", :tag => "#{s.version}" }
  s.source_files  = "resource", "CuteLogger/resource/*.{h,m,swift}"
  s.frameworks = "Foundation", "UIKit"
  s.dependency 'SSZipArchive', '~> 1.8.1'
end
