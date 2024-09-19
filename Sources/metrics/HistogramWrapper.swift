//
//  AnyHistogramMetricWrapper.swift
//  OpenTelemetryWrapper
//
//  Created by Alexis BURGOS on 20/08/2024.
//

import Foundation
import OpenTelemetryApi

/// A wrapper class for `LongHistogram` to expose it to Objective-C.
///
/// This class provides an interface for interacting with a `LongHistogram`
/// from Objective-C code, allowing for the recording of integer values.
@objc public class LongHistogramWrapper: NSObject {
    
    /// The underlying `LongHistogram` instance responsible for recording histogram data.
    var histogram: LongHistogram
    
    /// Initializes a new `LongHistogramWrapper` instance with the provided `LongHistogram`.
    ///
    /// - Parameter histogram: The `LongHistogram` instance to wrap.
    public init(histogram: LongHistogram) {
        self.histogram = histogram
    }
    
    /// Records the specified value in the histogram.
    ///
    /// - Parameter value: The integer value to record in the histogram.
    @objc public func record(value: Int) {
        self.histogram.record(value: value)
    }
}

/// A wrapper class for `DoubleHistogram` to expose it to Objective-C.
///
/// This class provides an interface for interacting with a `DoubleHistogram`
/// from Objective-C code, allowing for the recording of double values.
@objc public class DoubleHistogramWrapper: NSObject {
    
    /// The underlying `DoubleHistogram` instance responsible for recording histogram data.
    var histogram: DoubleHistogram
    
    /// Initializes a new `DoubleHistogramWrapper` instance with the provided `DoubleHistogram`.
    ///
    /// - Parameter histogram: The `DoubleHistogram` instance to wrap.
    public init(histogram: DoubleHistogram) {
        self.histogram = histogram
    }
    
    /// Records the specified value in the histogram.
    ///
    /// - Parameter value: The double value to record in the histogram.
    @objc public func record(value: Double) {
        self.histogram.record(value: value)
    }
}
