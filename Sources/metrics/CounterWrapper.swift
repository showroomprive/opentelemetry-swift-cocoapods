//
//  AnyCounterMetricWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 20/08/2024.
//

import Foundation
import OpenTelemetryApi

/// A wrapper class for the `LongCounter` to expose it to Objective-C.
///
/// This class provides a simple interface for adding values to a `LongCounter`
/// from Objective-C code by wrapping the `LongCounter` from the OpenTelemetry SDK.
@objc public class LongCounterWrapper: NSObject {
    
    /// The underlying `LongCounter` instance that this wrapper interacts with.
    var counter: LongCounter
    
    /// Initializes a new `LongCounterWrapper` instance with the specified `LongCounter`.
    ///
    /// - Parameter counter: The `LongCounter` instance to be wrapped and used for recording values.
    public init(counter: LongCounter) {
        self.counter = counter
    }
    
    /// Adds a value to the `LongCounter`.
    ///
    /// - Parameter value: The value to add to the counter.
    @objc public func add(value: Int) {
        self.counter.add(value: value)
    }
}

/// A wrapper class for the `DoubleCounter` to expose it to Objective-C.
///
/// This class provides a simple interface for adding values to a `DoubleCounter`
/// from Objective-C code by wrapping the `DoubleCounter` from the OpenTelemetry SDK.
@objc public class DoubleCounterWrapper: NSObject {
    
    /// The underlying `DoubleCounter` instance that this wrapper interacts with.
    var counter: DoubleCounter
    
    /// Initializes a new `DoubleCounterWrapper` instance with the specified `DoubleCounter`.
    ///
    /// - Parameter counter: The `DoubleCounter` instance to be wrapped and used for recording values.
    public init(counter: DoubleCounter) {
        self.counter = counter
    }
    
    /// Adds a value to the `DoubleCounter`.
    ///
    /// - Parameter value: The value to add to the counter.
    @objc public func add(value: Double) {
        self.counter.add(value: value)
    }
}
