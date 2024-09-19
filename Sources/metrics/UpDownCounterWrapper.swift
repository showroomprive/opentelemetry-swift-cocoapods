//
//  AnyUpDownCounterMetricWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 21/08/2024.
//

import Foundation
import OpenTelemetryApi

/// A wrapper class for `LongUpDownCounter` to expose it to Objective-C.
///
/// This class provides an interface for interacting with a `LongUpDownCounter`
/// from Objective-C code, allowing for the addition of integer values.
@objc public class LongUpDownCounterWrapper: NSObject {
    
    /// The underlying `LongUpDownCounter` instance responsible for tracking the counter metric.
    var counter: LongUpDownCounter
    
    /// Initializes a new `LongUpDownCounterWrapper` instance with the provided `LongUpDownCounter`.
    ///
    /// - Parameter counter: The `LongUpDownCounter` instance to wrap.
    public init(counter: LongUpDownCounter) {
        self.counter = counter
    }
    
    /// Adds the specified value to the counter.
    ///
    /// - Parameter value: The integer value to add to the counter.
    @objc public func add(value: Int) {
        self.counter.add(value: value)
    }
}

/// A wrapper class for `DoubleUpDownCounter` to expose it to Objective-C.
///
/// This class provides an interface for interacting with a `DoubleUpDownCounter`
/// from Objective-C code, allowing for the addition of double values.
@objc public class DoubleUpDownCounterWrapper: NSObject {
    
    /// The underlying `DoubleUpDownCounter` instance responsible for tracking the counter metric.
    var counter: DoubleUpDownCounter
    
    /// Initializes a new `DoubleUpDownCounterWrapper` instance with the provided `DoubleUpDownCounter`.
    ///
    /// - Parameter counter: The `DoubleUpDownCounter` instance to wrap.
    public init(counter: DoubleUpDownCounter) {
        self.counter = counter
    }
    
    /// Adds the specified value to the counter.
    ///
    /// - Parameter value: The double value to add to the counter.
    @objc public func add(value: Double) {
        self.counter.add(value: value)
    }
}
