//
//  SeverityWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 12/07/2024.
//

import Foundation
import OpenTelemetryApi

/// Enum representing the different severity levels for logs, usable in Objective-C code.
///
/// This enum allows you to specify the severity of an event when logging, making it easier to filter and analyze logs based on their importance,/// aiding in troubleshooting and monitoring of Objective-C applications.
@objc public enum SeverityWrapper: Int, RawRepresentable {
    /// The lowest severity level, used for very detailed debugging information that might be too verbose for general use.
    case trace
    /// Severity level used for debugging information, providing insights into the application's flow and state.
    case debug
    /// Severity level used for general information about the application's operation, indicating normal events and milestones.
    case info
    /// Severity level used for warnings indicating potential problems that might require attention, but haven't yetcaused failures.
    case warn
    /// Severity level used for errors indicating problems that have caused malfunctions or unexpected behavior, requiring investigation and resolution.
    case error
    
    /// The raw (Int) value type representing a semantic attribute.
    public typealias RawValue = Int
    
    /// Returns the raw (Int) value corresponding to the severity level, allowing for easy mapping and comparison of severity levels.
    public var rawValue: RawValue {
        switch self {
            case .trace:
                return Severity.trace.rawValue
            case .debug:
                return Severity.debug.rawValue
            case .info:
                return Severity.info.rawValue
            case .warn:
                return Severity.warn.rawValue
            case .error:
                return Severity.error.rawValue
        }
    }
    
    /// Initializes a new instance of SeverityWrapper from a raw (Int) value.
    ///
    /// - Parameter rawValue: The raw value representing the severity level. If the provided value does not correspond to a valid severity level, initialization fails.
    public init?(rawValue: RawValue) {
        switch rawValue {
            case Severity.trace.rawValue:
                self = .trace
            case Severity.debug.rawValue:
                self = .debug
            case Severity.info.rawValue:
                self = .info
            case Severity.warn.rawValue:
                self = .warn
            case Severity.error.rawValue:
                self = .error
            default:
                return nil
        }
    }
}
