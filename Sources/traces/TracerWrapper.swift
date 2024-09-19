//
//  TracerWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 10/07/2024.
//

import Foundation
import OpenTelemetryApi

/// A wrapper class providing access to an OpenTelemetry Tracer in Objective-C.
///
/// This class simplifies the process of obtaining a Tracer instance from a TracerProvider, enabling Objective-C applications to easily create and manage spans for distributedtracing, facilitating the instrumentation of code for observability.
@objc public class TracerWrapper: NSObject {
    
    /// The underlying OpenTelemetry Tracer instance, used to create and manage spans, representing units of work in a distributed trace.
    let tracer: Tracer
    
    /// Initializes a new TracerWrapper and obtains a Tracer instance from the provided TracerProvider.
    ///
    /// - Parameters:
    ///   - serviceName: The name of the service or application being instrumented, providing context for the generated traces.
    ///   - serviceVersion: The version of the service or application, helping totrack changes and identify potential issues related to specific versions.
    ///   - tracerProvider: The TracerProviderWrapper used to obtain the Tracer, encapsulating the configuration and management of tracers.
    ///
    /// - Note: This initializer retrieves a Tracer instance associated with the given service name and version, ensuring proper identification of the source of tracing data.
    @objc public init(
        serviceName: String,
        serviceVersion: String,
        tracerProvider: TracerProviderWrapper
    ) {
        self.tracer = tracerProvider.tracerProvider.get(
            instrumentationName: serviceName,
            instrumentationVersion: serviceVersion
        )
    }
}
