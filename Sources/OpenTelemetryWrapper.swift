//
//  OpenTelemetryWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 12/07/2024.
//

import Foundation
import OpenTelemetryApi
import OpenTelemetrySdk

/// A wrapper class for initializing and managing the OpenTelemetry instance in Objective-C.
///
/// This class simplifies the setup process by registering the tracer provider, logger provider,
/// meter provider,and context propagators, providing easy access to the OpenTelemetry instance from Objective-C code.
@objc public class OpenTelemetryWrapper: NSObject {
    
    /// The shared OpenTelemetry instance, providing a unified entry point for interacting with OpenTelemetry APIs.
    let opentelemetry: OpenTelemetry
    
    /// Initializes the OpenTelemetry instance with the provided logger provider, tracer provider, meter provider, and context propagators.
    ///
    /// - Parameters:
    ///   - loggerProvider: The logger provider wrapper responsible for logging within the application.
    ///   - tracerProvider: The tracerprovider wrapper responsible for creating and managing tracers, enabling distributed tracing.
    ///   - meterProvider: The meter provider wrapper responsible for managing metrics, allowing for the collection and reporting of application performance data.
    ///   - contextPropagators: The context propagators wrapper responsible for propagating trace context and baggage across process boundaries, ensuring continuity of traces and context across distributed systems.
    ///
    /// - Note: This initializer sets up the global OpenTelemetry instance by registering the provided providers and propagators,
    /// establishing the foundation for observability within the application.
    @objc public init(
        loggerProvider: LoggerProviderWrapper,
        tracerProvider: TracerProviderWrapper,
        meterProvider: MeterProviderWrapper,
        contextPropagators: ContextPropagatorsWrapper
    ) {
        // Register the logger provider with the global OpenTelemetry instance
        OpenTelemetry.registerLoggerProvider(loggerProvider: loggerProvider.loggerProvider)
        
        // Register the tracer provider with the global OpenTelemetry instance
        OpenTelemetry.registerTracerProvider(tracerProvider: tracerProvider.tracerProvider)
        
        // Register the meter provider with the global OpenTelemetry instance
        OpenTelemetry.registerStableMeterProvider(meterProvider: meterProvider.meterProvider)
        
        // Register the context propagators with the global OpenTelemetry instance
        OpenTelemetry.registerPropagators(
            textPropagators: [contextPropagators.textMapPropagator],
            baggagePropagator: contextPropagators.textMapBaggagePropagator
        )
        
        // Assign the singleton OpenTelemetry instance
        self.opentelemetry = OpenTelemetry.instance
    }
}
