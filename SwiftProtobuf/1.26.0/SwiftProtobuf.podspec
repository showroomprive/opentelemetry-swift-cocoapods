Pod::Spec.new do |s|
    s.name             = 'SwiftProtobuf'
    s.version          = '1.26.0'
    s.summary          = 'Swift Protobuf library'
    s.description      = 'The SwiftProtobuf library facilitates serialization and deserialization of data in Protobuf format within Swift applications.'
    
    s.homepage         = 'https://github.com/apple/swift-protobuf'
    s.license          = 'Apache License 2.0'

    s.module_name      = 'SwiftProtobuf'
    s.author           = { 'alexis-burgos' => 'alexis.burgos@showroomprive.net' }
    s.source           = { :git => 'https://github.com/apple/swift-protobuf.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '14.0'
    s.swift_versions = '5.9'
    s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC', 'DEFINES_MODULE' => 'YES' }

    s.source_files = 'Sources/SwiftProtobuf/**/*.swift'
    s.resource_bundle = {'SwiftProtobuf' => ['Sources/SwiftProtobuf/PrivacyInfo.xcprivacy']}
end
