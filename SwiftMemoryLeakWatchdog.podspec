Pod::Spec.new do |spec|

  spec.name         = "SwiftMemoryLeakWatchdog"
  spec.version      = "0.0.2"
  spec.summary      = "Memory leak watchdog for swift."
  spec.author       = { "coutryLane" => "1808982819@qq.com" }

  spec.description  = "Swift memory leak watchdog. Check memory leak while page exiting"
  spec.homepage     = "https://github.com/countryLane/memory_leak_watchdog"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/countryLane/memory_leak_watchdog.git", :tag => spec.version }
  spec.source_files = "memory_leak_watchdog/MemoryCheck/*.{h,m,swift}", "memory_leak_watchdog/Swizzle/*.{h,m,swift}"

  spec.framework  = "Foundation", "UIKit"
  spec.requires_arc = true
  spec.swift_version = '5.0'

end
