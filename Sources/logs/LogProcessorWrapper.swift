//
//  LogProcessorWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 13/08/2024.
//

import Foundation
import OpenTelemetrySdk

/// `LogProcessorWrapper` is a class that wraps the `LogRecordProcessor` to expose it to Objective-C code.
///
/// This class is used to process log records and export them using a specified `HttpLogExporterWrapper`. The logs are processed in batches with a default scheduling delay.
///
/// ### Usage
///
/// `LogProcessorWrapper` is primarily used to set up a log processor that handles log records and exports them via the provided HTTP exporter.
///
/// ```swift
/// let logExporter = HttpLogExporterWrapper(endpoint: "https://example.com/logs")
/// let logProcessor = LogProcessorWrapper(httpLogExporter: logExporter)
/// ```
///
/// ### Properties
/// - `logProcessor`: The underlying `LogRecordProcessor` instance that handles the processing and exporting of log records.
///
/// ### Initializer
/// - `init(httpLogExporter: HttpLogExporterWrapper)`: Initializes a new instance of `LogProcessorWrapper` with the provided `HttpLogExporterWrapper`.
///     - Parameter httpLogExporter: An instance of `HttpLogExporterWrapper` that defines the endpoint for exporting logs.
@objc public class LogProcessorWrapper: NSObject {
    
    /// The underlying `LogRecordProcessor` instance that handles the processing and exporting of log records.
    let logProcessor: LogRecordProcessor
    
    /// Initializes a new instance of `LogProcessorWrapper` with the provided `HttpLogExporterWrapper`.
    ///
    /// - Parameter httpLogExporter: An instance of `HttpLogExporterWrapper` that defines the endpoint for exporting logs.
    @objc public init(httpLogExporter: HttpLogExporterWrapper) {
        self.logProcessor = BatchLogRecordProcessor(
            logRecordExporter: httpLogExporter.httpLogExporter,
            scheduleDelay: 5
        )
    }
}
