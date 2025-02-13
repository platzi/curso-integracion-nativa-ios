//
//  DeliveryStatus.swift
//  NativeComponents-iOS
//

import Foundation

enum DeliveryStatus: String, Codable {
    case pending = "PENDIENTE"
    case sent = "ENVIADO"
    case inTransit = "EN REPARTO"
    case deliviered = "ENTREGADO"
}
