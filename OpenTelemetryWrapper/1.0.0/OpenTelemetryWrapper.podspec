Pod::Spec.new do |s|
    s.name                      = 'OpenTelemetryWrapper'
    s.version                   = '1.0.0'
    s.summary                   = 'OpenTelemetry Swift wrappers with Objective-C compatibility'
    s.description               = 'Swift wrappers to expose the OpenTelemetry Swift SDK to KMP with Objective-C annotations'

    s.homepage                  = 'https://github.com/showroomprive/opentelemetry-swift-wrapper'
    s.license                   = 'Apache License 2.0'

    s.module_name               = 'OpenTelemetryWrapper'
    s.author                    = { 'alexis-burgos' => 'alexis.burgos@showroomprive.net' }
    s.source                    = { :git => 'https://github.com/showroomprive/opentelemetry-swift-wrapper.git', :tag => s.version.to_s }

    s.ios.deployment_target     = '14.0'
    s.swift_versions            = '5.9'
    s.pod_target_xcconfig       = { 'OTHER_LDFLAGS' => '-lObjC', 'DEFINES_MODULE' => 'YES' }

    s.source_files              = 'Sources/**/*.{swift}'
    s.dependency 'OpenTelemetryProtocolExporterHttp', '~> 1.0'
    s.dependency 'ResourceExtension', '~> 1.0'
    s.dependency 'StdoutExporter', '~> 1.0'
end