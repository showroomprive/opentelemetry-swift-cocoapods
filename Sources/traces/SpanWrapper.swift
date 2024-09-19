//
//  SpanWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 10/07/2024.
//

import Foundation
import OpenTelemetryApi
import OpenTelemetrySdk

/// A wrapper class providing a simplified interface for interacting with OpenTelemetry Spans in Objective-C.
///
/// This class allows you to create, manage, and end spans, as well as set attributes andadd events, bridging the gap between the OpenTelemetry Swift API and Objective-C applications, enabling seamless integration of distributed tracing capabilities.
@objc public class SpanWrapper: NSObject {
    
    /// The underlying OpenTelemetry Span instance, representing a single operation within a trace, capturing timing information and associated metadata.
    let span: Span
    
    /// Initializes a new SpanWrapper and starts a new span, representing a unit of work in a distributed trace.
    ///
    /// - Parameters:
    ///   - tracerWrapper: The TracerWrapper used to create the span, providing access to the underlying OpenTelemetrytracer.
    ///   - name: The name of the span, providing a descriptive label for the operation being traced.
    ///   - parentSpan: An optional parent SpanWrapper, if this span is a child span, establishing the hierarchical relationship within the trace.
    ///
    /// - Note: The created span is of kind `SpanKind.client`, indicating that it represents an outbound operation initiated by the instrumented application.
    @objc public init(
        tracerWrapper: TracerWrapper,
        name: String,
        parentSpan: SpanWrapper?
    ) {
        let spanBuilder = tracerWrapper.tracer
            .spanBuilder(spanName: name)
            .setSpanKind(spanKind: SpanKind.client)
        
        if let parentSpan = parentSpan {
            spanBuilder.setParent(parentSpan.span)
        }
        
        self.span = spanBuilder.startSpan()
    }
    
    /// Sets a string attribute on the span, associating a key-value pair with the span to provide additional context.
    ///
    /// - Parameters:
    ///   - key: The attribute key, a string identifier for the attribute.
    ///   - value: The attribute value, a string representing the value associated with the key.
    @objc public func setStringAttribute(key: String, value: String) {
        span.setAttribute(key: key, value: value)
    }
    
    /// Sets an integer attribute on the span, associating a key-value pair with the span to provide additional context.
    ///
    /// - Parameters:
    ///   - key: The attribute key, a string identifier for the attribute.
    ///   - value: The attribute value, an integer representing the value associated with the key.
    @objc public func setIntAttribute(key: String, value: Int) {
        span.setAttribute(key: key, value: value)
    }
    
    /// Sets a double attribute on the span, associating a key-value pair with the span to provide additional context.
    ///
    /// - Parameters:
    ///   - key: The attribute key, a string identifier for the attribute.
    ///   - value: The attribute value, a double representing the value associated with the key.
    @objc public func setDoubleAttribute(key: String, value: Double) {
        span.setAttribute(key: key, value: value)
    }
    
    /// Sets a boolean attribute on the span, associating a key-value pair with the span to provide additional context.
    ///
    /// - Parameters:
    ///   - key: The attribute key, a string identifier for the attribute.
    ///   - value: The attribute value, a boolean representing the value associated with the key.
    @objc public func setBoolAttribute(key: String, value: Bool) {
        span.setAttribute(key: key, value: value)
    }
    
    /// Sets a string semantic attribute on the span, using a predefined key from `SemanticAttributesWrapper` to ensure consistency and interoperability.
    ///
    /// - Parameters:
    ///   - key: The semantic attribute key (from SemanticAttributesWrapper), representing a standardized attribute for common use cases.
    ///   - value: The attribute value, a string representing the value associated with the semantic attribute.
    @objc public func setStringSemanticAttribute(key: SemanticAttributesWrapper, value: String) {
        span.setAttribute(key: key.rawValue, value: value)
    }
    
    /// Sets an integer semantic attribute on the span, using a predefined key from `SemanticAttributesWrapper` to ensure consistency and interoperability.
    ///
    /// - Parameters:
    ///   - key: The semantic attribute key (from SemanticAttributesWrapper), representing a standardized attribute for common use cases.
    ///   - value: The attribute value, an integer representing the value associated with the semantic attribute.
    @objc public func setIntSemanticAttribute(key: SemanticAttributesWrapper, value: Int) {
        span.setAttribute(key: key.rawValue, value: value)
    }
    
    /// Sets a double semantic attribute on the span, using a predefined key from `SemanticAttributesWrapper` to ensure consistency and interoperability.
    ///
    /// - Parameters:
    ///   - key: The semantic attribute key (from SemanticAttributesWrapper), representing a standardized attribute for common use cases.
    ///   - value: The attribute value, a double representing the value associated with the semantic attribute.
    @objc public func setDoubleSemanticAttribute(key: SemanticAttributesWrapper, value: Double) {
        span.setAttribute(key: key.rawValue, value: value)
    }
    
    /// Sets a boolean semantic attribute on the span, using a predefined key from `SemanticAttributesWrapper` to ensure consistency and interoperability.
    ///
    /// - Parameters:
    ///   - key: The semantic attribute key (from SemanticAttributesWrapper), representing a standardized attribute for common use cases.
    ///   - value: The attribute value, a boolean representing the value associated with the semantic attribute.
    @objc public func setBoolSemanticAttribute(key: SemanticAttributesWrapper, value: Bool) {
        span.setAttribute(key: key.rawValue, value: value)
    }
    
    /// Adds an event to the span, marking a specific point in time or occurrence during the span's execution.
    ///
    /// - Parameters:
    ///   - name: The name of the event, providing a descriptive label for the event being recorded.
    ///   - timestamp: An optional timestamp for the event (NSDate), allowing for precise timing of events within the span. If not provided, the current time is used.
    @objc public func addEvent(name: String, timestamp: NSDate? = nil) {if let timestamp = timestamp {
        span.addEvent(name: name, timestamp: timestamp as Date)
    } else {
        span.addEvent(name: name)
    }
    }
    
    /// Ends the span, marking the completion of the operation being traced and signaling that the span data is ready for processing and export.
    @objc public func end() {
        span.end()
    }
}
