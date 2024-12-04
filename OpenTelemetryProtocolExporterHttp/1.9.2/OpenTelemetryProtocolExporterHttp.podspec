Pod::Spec.new do |s|
    s.name             = 'OpenTelemetryProtocolExporterHttp'
    s.version          = '1.9.2'
    s.summary          = 'HTTP protocol exporter for OpenTelemetry Swift SDK'
    s.description      = 'Export OpenTelemetry spans to HTTP protocol'
    
    s.homepage         = 'https://github.com/open-telemetry/opentelemetry-swift'
    s.license          = 'Apache License 2.0'

    s.module_name      = 'OpenTelemetryProtocolExporterHttp'
    s.author           = { 'alexis-burgos' => 'alexis.burgos@showroomprive.net' }
    s.source           = { :git => 'https://github.com/open-telemetry/opentelemetry-swift.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '14.0'
    s.swift_versions = '5.9'
    s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC', 'DEFINES_MODULE' => 'YES' }

    s.source_files = 'Sources/Exporters/OpenTelemetryProtocolHttp/**/*.{swift}'
    s.dependency 'OpenTelemetryProtocolExporterCommon', "~> #{s.version.to_s}"
end
