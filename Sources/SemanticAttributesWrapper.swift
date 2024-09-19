//
//  SemanticAttributesWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 17/07/2024.
//

import OpenTelemetryApi

/// Provides a convenient way to access common OpenTelemetry semantic attributes in Objective-C code.
///
/// This enum encapsulates a set of predefined semantic attribute keys, allowing for easy and consistent use of these attributes when instrumenting Objective-C applications.
@objc public enum SemanticAttributesWrapper: Int, RawRepresentable {
    /// Represents the HTTP request method attribute, indicating the method used for the HTTP request (e.g., GET, POST, PUT).
    case httpRequestMethod
    
    /// Represents the full URL attribute, capturing the complete URL of the HTTP request being processed.
    case urlFull
    
    /// Represents the HTTP response status code attribute, indicating the numerical status code returned by the HTTP server.
    case httpResponseStatusCode
    
    /// The raw string value type representing a semantic attribute.
    public typealias RawValue = String
    
    /// Returns the raw string value of the semantic attribute, which is the actual key used to associate the attribute with telemetry data.
    public var rawValue: RawValue {
        switch self {
            case .httpRequestMethod:
                return SemanticAttributes.httpRequestMethod.rawValue
            case .urlFull:
                return SemanticAttributes.urlFull.rawValue
            case .httpResponseStatusCode:
                return SemanticAttributes.httpResponseStatusCode.rawValue
        }
    }
    
    /// Initializes a new instance of the enum from a raw string value.
    ///
    /// - Parameter rawValue: The raw string value of the semantic attribute. If the provided value does not match any known semantic attribute, initialization fails.
    public init?(rawValue: RawValue) {
        switch rawValue {
            case SemanticAttributes.httpRequestMethod.rawValue:
                self = .httpRequestMethod
            case SemanticAttributes.urlFull.rawValue:
                self = .urlFull
            case SemanticAttributes.httpResponseStatusCode.rawValue:
                self = .httpResponseStatusCode
            default:
                return nil
        }
    }
}
