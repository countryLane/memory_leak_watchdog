Pod::Spec.new do |spec|

  spec.name         = "SwiftMemoryLeakWatchdog"
  spec.version      = "0.0.1"
  spec.summary      = "Memory leak watchdog for swift."
  spec.author       = { "coutryLane" => "1808982819@qq.com" }

  spec.description  = "Swift memory leak watchdog. Check memory leak while page exiting"
  spec.homepage     = "https://github.com/countryLane/memory_leak_watchdog"
  spec.license      = "MIT"
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/countryLane/memory_leak_watchdog.git", :tag => "0.0.1" }
  spec.source_files  = "memory_leak_watchdog/MemoryCheck/**/*.{h, m, swift}", "memory_leak_watchdog/Swizzle/**/*.{h, m, swift}"
  # spec.public_header_files = "Classes/**/*.h"

  spec.framework  = "Foundation", "UIKit"
  spec.requires_arc = true

end
