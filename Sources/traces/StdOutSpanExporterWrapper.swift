//
//  SpanExporterWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 11/07/2024.
//

import Foundation
import OpenTelemetryProtocolExporterHttp
import StdoutExporter

/// A wrapper class providing access to the StdoutExporter for exporting spans in Objective-C.
///
/// This class simplifies the usage of the StdoutExporter, allowing Objective-C applications toeasily output collected span data to the console for debugging and development purposes, aiding in the understanding and troubleshooting of tracing information.
@objc public class StdOutSpanExporterWrapper: NSObject {
    
    /// The underlying StdoutExporter instance, responsible for writing span data to the standard output stream.
    let stdOutExporter: StdoutExporter
    
    /// Initializes a new instance of the StdOutSpanExporterWrapper, creating a StdoutExporter that will output span data to the console.
    ///
    /// - Note: This initializer sets up the StdoutExporter, enabling immediate visibility of span data during development andtesting, facilitating the identification and resolution of potential tracing issues.
    @objc public override init() {
        self.stdOutExporter = StdoutExporter()
    }
}
