//
//  ResourceWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 10/07/2024.
//

import Foundation
import ResourceExtension
import OpenTelemetryApi
import OpenTelemetrySdk

/// A wrapper class for creating and managing OpenTelemetry Resources in Objective-C.
///
/// This class simplifies the process of defining resources with essential attributes like service name and version,/// making it easier to integrate OpenTelemetry into Objective-C applications.
@objc public class ResourceWrapper: NSObject {
    
    /// The underlying OpenTelemetry Resource instance, containing key-value pairs that describe the entity producing telemetry.
    let resource: Resource
    
    /// Initializes a new ResourceWrapper with the given service name and version.
    ///
    /// - Parameters:
    ///   - serviceName: The name of the service or application, providing context for the generated telemetry data.
    ///   - serviceVersion: The version of the service or application, helping to track changes and identify potential issuesrelated to specific versions.
    ///
    /// - Note: The initialized Resource instance includes attributes for service name and version, which are crucial for identifying the source of telemetry data.
    @objc public init(
        serviceName: String,
        serviceVersion: String
    ) {
        self.resource = Resource(attributes: [
            ResourceAttributes.serviceName.rawValue : AttributeValue.string(serviceName),
            ResourceAttributes.serviceVersion.rawValue : AttributeValue.string(serviceVersion)
        ])
    }
}
