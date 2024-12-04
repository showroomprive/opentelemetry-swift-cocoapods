Pod::Spec.new do |s|
    s.name             = 'StdoutExporter'
    s.version          = '1.11.0'
    s.summary          = 'StdoutExporter for OpenTelemetry Swift SDK'
    s.description      = 'Export OpenTelemetry spans to stdout'

    s.homepage         = 'https://github.com/open-telemetry/opentelemetry-swift'
    s.license          = 'Apache License 2.0'

    s.module_name      = 'StdoutExporter'
    s.author           = { 'alexis-burgos' => 'alexis.burgos@showroomprive.net' }
    s.source           = { :git => 'https://github.com/open-telemetry/opentelemetry-swift.git', :tag => s.version.to_s }

    s.ios.deployment_target = '14.0'
    s.swift_versions = '5.9'
    s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC', 'DEFINES_MODULE' => 'YES' }

    s.source_files = 'Sources/Exporters/Stdout/**/*.{swift}'
    s.dependency 'OpenTelemetry-Swift-Sdk', "~> #{s.version.to_s}"
end
