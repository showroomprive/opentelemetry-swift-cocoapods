Pod::Spec.new do |s|
    s.name             = 'Logging'
    s.version          = '1.6.1'
    s.summary          = 'Swift Logging library'
    s.description      = 'The Logging library provides a unified logging API in Swift, simplifying logging implementation across different platforms and environments.'
    
    s.homepage         = 'https://github.com/apple/swift-log'
    s.license          = 'Apache License 2.0'

    s.module_name      = 'Logging'
    s.author           = { 'alexis-burgos' => 'alexis.burgos@showroomprive.net' }
    s.source           = { :git => 'https://github.com/apple/swift-log.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '14.0'
    s.swift_versions = '5.9'
    s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC', 'DEFINES_MODULE' => 'YES' }

    s.source_files = 'Sources/Logging/**/*.swift'
end
