//
//  DeliveryAttributes.swift
//  NativeComponents-iOS
//

import Foundation
import ActivityKit

struct DeliveryAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var deliveryStatus: DeliveryStatus
        var productName: String
        var eta: String
    }
}
