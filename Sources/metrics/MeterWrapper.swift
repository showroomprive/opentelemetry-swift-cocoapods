//
//  MeterWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 20/08/2024.
//

import Foundation
import OpenTelemetryApi
import OpenTelemetrySdk

/// A wrapper class for the `StableMeter` to expose it to Objective-C.
///
/// This class provides an interface to create various metric instruments such as counters,
/// gauges, histograms, andup-down counters, making the OpenTelemetry metrics API
/// accessible from Objective-C code, enabling the collection and reporting of application performance data.
@objc public class MeterWrapper: NSObject {
    
    /// The underlying `StableMeter` instance used for creating metric instruments, providing access to the core functionality of the OpenTelemetry Metrics API.
    let meter: StableMeter
    
    /// Initializes a new `MeterWrapper` instance with the specified service name, version, and meter provider.
    ///
    /// - Parameters:
    ///   - serviceName: The name of the service for which the meteris being created, providing context for the generated metrics.
    ///   - serviceVersion: The version of the service for which the meter is being created, helping to track changes and identify potential issues related to specific versions.
    ///   - meterProvider: The `MeterProviderWrapper` that supplies the meter provider used to create the meter, encapsulating the configuration and management of meters.
    ///
    /// - Note: This initializer constructs a `StableMeter` instance associated with the given service name and version, establishing the foundation for creating metric instruments.
    @objc public init(
        serviceName: String,
        serviceVersion: String,
        meterProvider: MeterProviderWrapper
    ) {
        self.meter = meterProvider.meterProvider.meterBuilder(name: serviceName)
            .setInstrumentationVersion(instrumentationVersion: serviceVersion)
            .build()
    }
}

@objc extension MeterWrapper {
    
    /// Creates a new long counter metric instrument.
    ///
    /// - Parameter name: The name of the counter, providing a unique identifier for the metric.
    /// - Parameter description: A description of the counter, providing additional context (currently not used by `StableMeter`).
    /// - Parameter unit: The unit of measurement for the counter values (currently not used by `StableMeter`).
    /// - Returns: A `LongCounterWrapper` instance wrapping the created long counter, allowing for interaction with the counter from Objective-C code.
    ///
    /// - Note: The `description` and `unit` parameters are currently ignored by the underlying `StableMeter` implementation.
    @objc public func createLongCounter(name: String, description: String? = nil, unit: String? = nil) -> LongCounterWrapper {
        let counter = self.meter.counterBuilder(name: name).build()
        return LongCounterWrapper(counter: counter)
    }
    
    /// Creates a new double counter metric instrument.
    ///
    /// - Parameter name: The name of the counter, providing a unique identifier for the metric.
    /// - Parameter description: A description of the counter, providing additional context (currently not used by `StableMeter`).
    /// - Parameter unit: The unit of measurement for the counter values (currently not used by `StableMeter`).
    /// - Returns: A `DoubleCounterWrapper` instance wrapping the created double counter, allowing for interaction with the counter from Objective-C code.
    ///
    /// - Note: The `description` and `unit` parameters are currently ignored by the underlying `StableMeter` implementation.
    @objc public func createDoubleCounter(name: String, description: String? = nil, unit: String? = nil) -> DoubleCounterWrapper {
        let counter = self.meter.counterBuilder(name: name).ofDoubles().build()
        return DoubleCounterWrapper(counter: counter)
    }
    
    /// Creates a new long gauge metric instrument.
    ///
    /// - Parameter name: The name of the gauge, providing a unique identifier for the metric.
    /// - Parameter description: A description of the gauge, providing additional context (currently not used by `StableMeter`).
    /// - Parameter unit: The unit of measurement for the gauge values (currently not used by `StableMeter`).
    /// - Returns: A `LongGaugeWrapper` instance wrapping the created long gauge, allowing for interaction with the gauge from Objective-C code.
    ///
    /// - Note: The `description` and `unit` parameters are currently ignored by the underlying `StableMeter`implementation.
    @objc public func createLongGauge(name: String, description: String? = nil, unit: String? = nil) -> LongGaugeWrapper {
        let gaugeBuilder = self.meter.gaugeBuilder(name: name).ofLongs()
        return LongGaugeWrapper(gaugeBuilder: gaugeBuilder)
    }
    
    /// Creates a new double gauge metric instrument.
    ///
    /// - Parameter name: The name of the gauge, providing a unique identifier for the metric.
    /// - Parameter description: A description of the gauge, providing additional context (currently not used by `StableMeter`).
    /// - Parameter unit: The unit of measurement for the gauge values (currently not used by `StableMeter`).
    /// - Returns: A `DoubleGaugeWrapper` instance wrapping the created double gauge, allowing for interaction with the gauge from Objective-C code.
    ///
    /// - Note: The `description` and `unit` parameters are currently ignored by the underlying `StableMeter` implementation.
    @objc public func createDoubleGauge(name: String, description: String? = nil, unit: String? = nil) -> DoubleGaugeWrapper {
        let gaugeBuilder = self.meter.gaugeBuilder(name: name)
        return DoubleGaugeWrapper(gaugeBuilder: gaugeBuilder)
    }
    
    /// Creates a new long histogram metric instrument.
    ///
    /// - Parameter name: The name of the histogram, providing a unique identifier for the metric.
    /// - Parameter description: A description of the histogram, providing additional context (currently not used by `StableMeter`).
    /// - Parameter unit: The unit of measurement for the histogram values (currently not used by `StableMeter`).
    /// - Returns: A `LongHistogramWrapper` instance wrapping the created long histogram, allowing for interaction with the histogram from Objective-C code.
    ///
    /// - Note: The `description` and `unit` parameters are currently ignored by the underlying `StableMeter` implementation.
    @objc public func createLongHistogram(name: String, description: String? = nil, unit: String? = nil) -> LongHistogramWrapper {
        let histogram = self.meter.histogramBuilder(name: name).ofLongs().build()
        return LongHistogramWrapper(histogram: histogram)
    }
    
    /// Creates a new double histogram metricinstrument.
    ///
    /// - Parameter name: The name of the histogram, providing a unique identifier for the metric.
    /// - Parameter description: A description of the histogram, providing additional context (currently not used by `StableMeter`).
    /// - Parameter unit: The unit of measurement for the histogram values (currently not used by `StableMeter`).
    /// - Returns: A `DoubleHistogramWrapper` instance wrapping the created double histogram, allowing for interaction with the histogram from Objective-C code.
    ///
    /// - Note: The `description` and `unit` parameters are currently ignored by the underlying `StableMeter` implementation.
    @objc public func createDoubleHistogram(name: String, description: String? = nil, unit: String? = nil) -> DoubleHistogramWrapper {
        let histogram = self.meter.histogramBuilder(name: name).build()
        return DoubleHistogramWrapper(histogram: histogram)
    }
    
    /// Creates a new long up-down counter metric instrument.
    ///
    /// - Parameter name: The name of the up-down counter, providing a unique identifier for the metric.
    /// - Parameter description: A description of the up-down counter, providing additional context (currently not used by `StableMeter`).
    /// - Parameter unit: The unit of measurement for the up-down counter values (currently not used by `StableMeter`).
    /// - Returns: A `LongUpDownCounterWrapper` instance wrapping the created long up-down counter, allowing for interaction with the counter from Objective-C code.
    ///
    /// - Note: The `description` and `unit` parameters are currently ignored by the underlying `StableMeter` implementation.
    @objc public func createLongUpDownCounter(name: String, description: String? = nil, unit: String? = nil) -> LongUpDownCounterWrapper {
        let counter = self.meter.upDownCounterBuilder(name: name).build()
        return LongUpDownCounterWrapper(counter: counter)
    }
    
    /// Creates a new double up-down counter metric instrument.
    ///
    /// - Parameter name: The name of the up-down counter, providing a unique identifier for the metric.
    /// - Parameter description: A description of the up-down counter, providing additional context (currently not used by `StableMeter`).
    /// - Parameter unit:The unit of measurement for the up-down counter values (currently not used by `StableMeter`).
    /// - Returns: A `DoubleUpDownCounterWrapper instance wrapping the created double up-down counter, allowing for interaction with the counter from Objective-C code.
    ///
    /// -Note: The `description` and `unit` parameters are currently ignored by the underlying `StableMeter` implementation.
    @objc public func createDoubleUpDownCounter(name: String, description: String? = nil, unit: String? = nil) -> DoubleUpDownCounterWrapper {
        let counter = self.meter.upDownCounterBuilder(name: name).ofDoubles().build()
        return DoubleUpDownCounterWrapper(counter: counter)
    }
}
