Pod::Spec.new do |s|
s.name         = "CWCalendarLabel"                #名称
s.version      = "1.0.3"                #版本号
s.summary      = "轻量级的日历形式滚动动画文本控件"        #简短介绍
s.description  = <<-DESC
CWCalendarLabel是一个轻量级的Label控件，可以快速实现日历效果的文本动画。
DESC

s.homepage     = "https://github.com/CoulsonWang/CWCalendarLabel"
s.license      = "MIT"                #开源协议
s.author       = { "Coulson_Wang" => "wangyuanyi1993@126.com" }

s.source       = { :git => "https://github.com/CoulsonWang/CWCalendarLabel.git", :tag => "#{s.version}" }


s.platform     = :ios, '7.0'
s.requires_arc = true                    #是否使用ARC

s.source_files = "CWCalendarLabel/CWCalendarLabel/CWCalendarLabel/* "

end
