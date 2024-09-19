//
//  TracerProviderWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 11/07/2024.
//

import Foundation
import OpenTelemetryApi
import OpenTelemetrySdk

/// A wrapper class for creating and managing an OpenTelemetry TracerProvider in Objective-C.
///
/// This class simplifies the process of building a TracerProvider, which is responsible for creating and managing tracers, with a given resource and span processor, enabling Objective-C applications to easily instrument code for distributed tracing.
@objc public class TracerProviderWrapper: NSObject {
    
    /// The underlying OpenTelemetry TracerProvider instance, responsible for creating and managing tracers used to generate spans for tracing operations.
    let tracerProvider: TracerProvider
    
    /// Initializes a new TracerProviderWrapper with the provided resource and span processor.
    ///
    /// - Parameters:
    ///   - resource: The ResourceWrapper defining the resource associated with the TracerProvider, providing context and metadata for the generated traces.
    ///- spanProcessor: The SpanProcessorWrapper defining how spans are processed before being exported, allowing for customization of span handling.
    ///
    /// - Note: This initializer constructs a TracerProvider with the specified resource and span processor, establishing the foundation for creating and managing tracers within the application.
    @objc public init(
        resource: ResourceWrapper,
        spanProcessor: SpanProcessorWrapper
    ) {
        self.tracerProvider = TracerProviderBuilder()
            .add(spanProcessor: spanProcessor.spanProcessor)
            .with(resource: resource.resource)
            .build()
    }
}
