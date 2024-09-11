//
//  MeterProviderWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 20/08/2024.
//

import OpenTelemetryApi
import OpenTelemetrySdk

/// A wrapper class for `StableMeterProvider`, providing an interface for Objective-C.
///
/// This class allows Objective-C code to interact with OpenTelemetry's `StableMeterProvider`,
/// which is used to create and manage meters for capturing metric data.
@objc public class MeterProviderWrapper: NSObject {
    
    /// The underlying `StableMeterProvider` instance that is wrapped by this class.
    let meterProvider: StableMeterProvider
    
    /// Initializes a new `MeterProviderWrapper` with the specified resource and metric reader.
    ///
    /// This initializer sets up the `StableMeterProvider` using the provided `ResourceWrapper`
    /// and `MetricReaderWrapper`, configuring it to capture metrics for the specified resources.
    ///
    /// - Parameters:
    ///   - resource: A `ResourceWrapper` instance representing the resources associated with the metrics.
    ///   - metricReader: A `MetricReaderWrapper` instance used to read and export the metrics.
    @objc public init(
        resource: ResourceWrapper,
        metricReader: MetricReaderWrapper
    ) {
        self.meterProvider = StableMeterProviderBuilder()
            .registerView(selector: InstrumentSelector.builder().setInstrument(name: ".*").build(), view: StableView.builder().build())
            .registerMetricReader(reader: metricReader.metricReader)
            .setResource(resource: resource.resource)
            .build()
    }
}
