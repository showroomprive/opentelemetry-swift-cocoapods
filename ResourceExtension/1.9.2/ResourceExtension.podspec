Pod::Spec.new do |s|
    s.name             = 'ResourceExtension'
    s.version          = '1.9.2'
    s.summary          = 'SDKResourceExtension provides details about the device as a Resource.'
    s.description      = 'SDKResourceExtension provides attributes in a resource object with details about the iOS device, OS details, and application details. It applies these values to the appropriate semantic attributes.'
    
    s.homepage         = 'https://opentelemetry.io/docs/languages/swift/libraries/'
    s.license          = 'Apache License 2.0'

    s.module_name      = 'ResourceExtension'
    s.author           = { 'alexis-burgos' => 'alexis.burgos@showroomprive.net' }
    s.source           = { :git => 'https://github.com/open-telemetry/opentelemetry-swift.git', :tag => s.version.to_s }

    s.ios.deployment_target = '14.0'
    s.swift_versions = '5.9'
    s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC', 'DEFINES_MODULE' => 'YES' }

    s.source_files = 'Sources/Instrumentation/SDKResourceExtension/**/*.{swift}'
    s.dependency 'OpenTelemetrySdk', "~> #{s.version.to_s}"
end
