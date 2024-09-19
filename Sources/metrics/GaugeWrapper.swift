//
//  AnyMeasureMetricWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 20/08/2024.
//

import Foundation
import OpenTelemetryApi

/// A wrapper class for `LongGaugeBuilder` to expose it to Objective-C.
///
/// This class provides an interface for interacting with a `LongGaugeBuilder`
/// from Objective-C code, allowing for the setting of integer gauge values.
@objc public class LongGaugeWrapper: NSObject {
    
    /// The underlying `LongGaugeBuilder` instance used to create and manage the gauge.
    var gaugeBuilder: LongGaugeBuilder
    
    /// Initializes a new `LongGaugeWrapper` instance with the provided `LongGaugeBuilder`.
    ///
    /// - Parameter gaugeBuilder: The `LongGaugeBuilder` instance to wrap.
    public init(gaugeBuilder: LongGaugeBuilder) {
        self.gaugeBuilder = gaugeBuilder
    }
    
    /// Sets the specified value in the gauge.
    ///
    /// This method builds the gauge using a callback that records the provided value,
    /// and then closes the gauge to finalize the measurement.
    ///
    /// - Parameter value: The integer value to set in the gauge.
    @objc public func set(value: Int) {
        self.gaugeBuilder.buildWithCallback({ callback in
            callback.record(value: value)
        }).close()
    }
}

/// A wrapper class for `DoubleGaugeBuilder` to expose it to Objective-C.
///
/// This class provides an interface for interacting with a `DoubleGaugeBuilder`
/// from Objective-C code, allowing for the setting of double gauge values.
@objc public class DoubleGaugeWrapper: NSObject {
    
    /// The underlying `DoubleGaugeBuilder` instance used to create and manage the gauge.
    var gaugeBuilder: DoubleGaugeBuilder
    
    /// Initializes a new `DoubleGaugeWrapper` instance with the provided `DoubleGaugeBuilder`.
    ///
    /// - Parameter gaugeBuilder: The `DoubleGaugeBuilder` instance to wrap.
    public init(gaugeBuilder: DoubleGaugeBuilder) {
        self.gaugeBuilder = gaugeBuilder
    }
    
    /// Sets the specified value in the gauge.
    ///
    /// This method builds the gauge using a callback that records the provided value,
    /// and then closes the gauge to finalize the measurement.
    ///
    /// - Parameter value: The double value to set in the gauge.
    @objc public func set(value: Double) {
        self.gaugeBuilder.buildWithCallback({ callback in
            callback.record(value: value)
        }).close()
    }
}
