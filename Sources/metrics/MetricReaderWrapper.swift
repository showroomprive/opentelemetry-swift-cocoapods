//
//  MeterReaderWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 21/08/2024.
//

import OpenTelemetryApi
import OpenTelemetrySdk

/// A wrapper class for the `StableMetricReader` to expose it to Objective-C.
///
/// This class facilitates the creation of a periodic metric reader that regularly exports metrics
/// using the specified `HttpMetricExporterWrapper`, making it accessible from Objective-C code.
@objc public class MetricReaderWrapper: NSObject {
    
    /// The underlying `StableMetricReader` instance responsible for reading and exporting metrics.
    let metricReader: StableMetricReader
    
    /// Initializes a new `MetricReaderWrapper` instance with the specified HTTP metric exporter.
    ///
    /// This initializer sets up a periodic metric reader that exports metrics at regular intervals
    /// using the provided `HttpMetricExporterWrapper`.
    ///
    /// - Parameter metricExporter: The `HttpMetricExporterWrapper` used to export metrics.
    ///
    /// - Note: The export interval is set to 5 seconds.
    @objc public init(
        metricExporter: HttpMetricExporterWrapper
    ) {
        self.metricReader = StablePeriodicMetricReaderBuilder(exporter: metricExporter.httpMetricExporter)
            .setInterval(timeInterval: 5)
            .build()
    }
}
