//
//  LoggerWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 14/08/2024.
//

import Foundation
import OpenTelemetryApi

/// `LoggerWrapper` is a class that wraps the `Logger` to expose it to Objective-C code.
///
/// This class allows for the creation and management of a `Logger` instance associated with a specific service name, utilizing the provided `LoggerProviderWrapper`.
///
/// ### Usage
///
/// `LoggerWrapper` is primarily used to create a logger tied to a particular service, enabling the generation and management of logs within that service context.
///
/// ```swift
/// let resource = ResourceWrapper(attributes: ["service.name": "MyService"])
/// let logExporter = HttpLogExporterWrapper(endpoint: "https://example.com/logs")
/// let logProcessor = LogProcessorWrapper(httpLogExporter: logExporter)
/// let loggerProvider = LoggerProviderWrapper(resource: resource, logProcessor: logProcessor)
/// let logger = LoggerWrapper(serviceName: "MyService", loggerProvider: loggerProvider)
/// ```
///
/// ### Properties
/// - `logger`: The underlying `Logger` instance responsible for generating and managing logs within the service context.
///
/// ### Initializer
/// - `init(serviceName: String, loggerProvider: LoggerProviderWrapper)`: Initializes a new instance of `LoggerWrapper` with the provided service name and logger provider.
///     - Parameters:
///         - `serviceName`: The name of the service associated with the logger.
///         - `loggerProvider`: An instance of `LoggerProviderWrapper` that manages the configuration and creation of loggers.
@objc public class LoggerWrapper: NSObject {
    
    /// The underlying `Logger` instance responsible for generating and managing logs within the service context.
    let logger: Logger
    
    /// Initializes a new instance of `LoggerWrapper` with the provided service name and logger provider.
    ///
    /// - Parameters:
    ///   - serviceName: The name of the service associated with the logger.
    ///   - loggerProvider: An instance of `LoggerProviderWrapper` that manages the configuration and creation of loggers.
    @objc public init(serviceName: String, loggerProvider: LoggerProviderWrapper) {
        self.logger = loggerProvider.loggerProvider.get(
            instrumentationScopeName: serviceName
        )
    }
    
    @objc public func log(message: String, severity: SeverityWrapper) {
        logger.logRecordBuilder()
            .setTimestamp(Date())
            .setSeverity(Severity(rawValue: severity.rawValue) ?? Severity.debug)
            .setBody(AttributeValue(message))
            .emit()
    }
}
