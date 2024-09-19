//
//  ContextPropagatorWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 12/07/2024.
//

import Foundation
import OpenTelemetryApi
import OpenTelemetrySdk

/// A wrapper class providing access to OpenTelemetry context propagators for use in Objective-C.
///
/// This class simplifies the usage of text map propagators for trace context and baggage,
/// making them accessible and easier to manage from Objective-C code.
@objc public class ContextPropagatorsWrapper: NSObject {
    
    /// The text map propagator for trace context.
    ///
    /// This propagator is responsible for extracting and injecting trace context across process boundaries,
    /// ensuring continuity of traces across distributed systems.
    let textMapPropagator: TextMapPropagator
    
    /// The text map propagator for baggage.
    ///
    /// This propagator handles the propagation of baggage information, which are key-value pairs associated with a trace,
    /// across process boundaries, allowing for context-specific data to be carried throughout the trace.
    let textMapBaggagePropagator: TextMapBaggagePropagator
    
    /// Initializes a new instance of `ContextPropagatorsWrapper` with default W3C propagators for trace context and baggage.
    ///
    /// - Note: The W3C Trace Context Propagator is used for trace context propagation, and the W3C Baggage Propagator is used for baggage propagation,
    /// adhering to the W3C standards for distributed tracing.
    @objc public override init() {
        // Initialize with the W3C Trace Context Propagator for trace context
        self.textMapPropagator = W3CTraceContextPropagator()
        
        // Initialize with the W3C Baggage Propagator for baggage
        self.textMapBaggagePropagator = W3CBaggagePropagator()
    }
}
