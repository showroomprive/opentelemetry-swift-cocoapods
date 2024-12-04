Pod::Spec.new do |s|
    s.name             = 'OpenTelemetryProtocolExporterCommon'
    s.version          = '1.11.0'
    s.summary          = 'Common exporter\'s code.'
    s.description      = 'Common exporter\'s code for OpenTelemetry specifics Exporters as OpenTelemetryProtocolExporterHttp or OpenTelemetryProtocolExporterGrpc'
    
    s.homepage         = 'https://github.com/open-telemetry/opentelemetry-swift'
    s.license          = 'Apache License 2.0'

    s.module_name      = 'OpenTelemetryProtocolExporterCommon'
    s.author           = { 'alexis-burgos' => 'alexis.burgos@showroomprive.net' }
    s.source           = { :git => 'https://github.com/open-telemetry/opentelemetry-swift.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '14.0'
    s.swift_versions = '5.9'
    s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC', 'DEFINES_MODULE' => 'YES' }

    s.source_files = 'Sources/Exporters/OpenTelemetryProtocolCommon/**/*.{swift}'
    s.dependency 'OpenTelemetry-Swift-Sdk', "~> #{s.version.to_s}"
    s.dependency 'Logging', '~> 1.0'
    s.dependency 'SwiftProtobuf', '~> 1.0'
end
