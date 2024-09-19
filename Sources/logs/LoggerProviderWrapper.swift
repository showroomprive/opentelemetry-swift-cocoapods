//
//  LoggerProviderWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 13/08/2024.
//

import OpenTelemetryApi
import OpenTelemetrySdk

/// `LoggerProviderWrapper` is a class that wraps the `LoggerProvider` to expose it to Objective-C code.
///
/// This class allows for the creation and configuration of a `LoggerProvider` that is used to generate loggers with specific settings, such as resource attributes and log processing capabilities.
///
/// ### Usage
///
/// `LoggerProviderWrapper` is primarily used to set up a logger provider with a specified resource and log processor, allowing logs to be created and processed according to the defined configurations.
///
/// ```swift
/// let resource = ResourceWrapper(attributes: ["service.name": "MyService"])
/// let logExporter = HttpLogExporterWrapper(endpoint: "https://example.com/logs")
/// let logProcessor = LogProcessorWrapper(httpLogExporter: logExporter)
/// let loggerProvider = LoggerProviderWrapper(resource: resource, logProcessor: logProcessor)
/// ```
///
/// ### Properties
/// - `loggerProvider`: The underlying `LoggerProvider` instance that manages loggers and their configurations.
///
/// ### Initializer
/// - `init(resource: ResourceWrapper, logProcessor: LogProcessorWrapper)`: Initializes a new instance of `LoggerProviderWrapper` with the provided resource and log processor.
///     - Parameters:
///         - `resource`: An instance of `ResourceWrapper` that defines the attributes associated with the logs.
///         - `logProcessor`: An instance of `LogProcessorWrapper` that handles the processing and exporting of logs.
@objc public class LoggerProviderWrapper: NSObject {
    
    /// The underlying `LoggerProvider` instance that manages loggers and their configurations.
    let loggerProvider: LoggerProvider
    
    /// Initializes a new instance of `LoggerProviderWrapper` with the provided resource and log processor.
    ///
    /// - Parameters:
    ///   - resource: An instance of `ResourceWrapper` that defines the attributes associated with the logs.
    ///   - logProcessor: An instance of `LogProcessorWrapper` that handles the processing and exporting of logs.
    @objc public init(resource: ResourceWrapper, logProcessor: LogProcessorWrapper) {
        self.loggerProvider = LoggerProviderBuilder()
            .with(processors: [logProcessor.logProcessor])
            .with(resource: resource.resource)
            .with(logLimits: LogLimits(maxAttributeLength: 256))
            .build()
    }
}
