Pod::Spec.new do |s|
    s.name             = 'OpenTelemetryApi'
    s.version          = '1.9.2'
    s.summary          = 'OpenTelemetry API for Swift'
    s.description      = 'OpenTelemetryApi source files from opentelemetry-swift API'
    
    s.homepage         = 'https://github.com/open-telemetry/opentelemetry-swift'
    s.license          = 'Apache License 2.0'
    
    s.module_name      = 'OpenTelemetryApi'
    s.author           = { 'alexis-burgos' => 'alexis.burgos@showroomprive.net' }
    s.source           = { :git => 'https://github.com/open-telemetry/opentelemetry-swift.git', :tag => s.version.to_s }

    s.ios.deployment_target = '14.0'
    s.swift_versions = '5.9'
    s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC', 'DEFINES_MODULE' => 'YES' }

    s.source_files = 'Sources/OpenTelemetryApi/**/*.{swift}'
end
