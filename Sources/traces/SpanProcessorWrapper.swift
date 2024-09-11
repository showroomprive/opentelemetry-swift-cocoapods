//
//  SpanProcessorWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 11/07/2024.
//

import OpenTelemetryApi
import OpenTelemetrySdk

/// A wrapper class for creating and managing an OpenTelemetry SpanProcessor in Objective-C.
///
/// This class simplifies the process of combining multiple span exporters, such as an HTTP exporter for sending spans toa remote collector and a Stdout exporter for logging spans to the console, into a single MultiSpanProcessor, streamlining the handling of span data in Objective-C applications.
@objc public class SpanProcessorWrapper: NSObject {
    
    /// The underlying OpenTelemetry SpanProcessor instance, responsible for processing finished spans before they are exported.
    let spanProcessor: SpanProcessor
    
    /// Initializes a new SpanProcessorWrapper with the provided HTTP and Stdout span exporters.
    ///
    /// It creates a MultiSpanProcessor that combines BatchSpanProcessors for both exporters, allowing for efficient and batched processing of spans beforethey are sent to their respective destinations.
    ///
    /// - Parameters:
    ///   - httpSpanExporter: The HttpSpanExporterWrapper for exporting spans to an HTTP endpoint, typically a remote collector for centralized tracing data.
    ///   - stdOutSpanExporter: The StdOutSpanExporterWrapper for exporting spans to standard output, useful for local debugging and development purposes.
    ///
    /// - Note: The BatchSpanProcessors are configured with a schedule delay of 5 seconds, meaning spans will be batched and exported every 5 seconds, optimizing network and I/O operations.
    @objc public init(
        httpSpanExporter: HttpSpanExporterWrapper,
        stdOutSpanExporter: StdOutSpanExporterWrapper
    ) {
        let httpSpanProcessor = BatchSpanProcessor(
            spanExporter: httpSpanExporter.httpSpanExporter,
            scheduleDelay: 5
        )
        let stdOutSpanProcessor = BatchSpanProcessor(
            spanExporter: stdOutSpanExporter.stdOutExporter,
            scheduleDelay: 5
        )
        self.spanProcessor = MultiSpanProcessor(spanProcessors: [httpSpanProcessor, stdOutSpanProcessor])
    }}
