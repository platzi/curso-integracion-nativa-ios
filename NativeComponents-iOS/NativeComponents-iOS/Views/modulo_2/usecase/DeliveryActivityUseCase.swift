//
//  UseCase.swift
//  NativeComponents-iOS
//

import Foundation
import ActivityKit

final class DeliveryActivityUseCase {
    static func startActivity(deliveryStatus: DeliveryStatus,
                              productName: String,
                              eta: String) throws -> String {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else { return "" }
        let initialState = DeliveryAttributes.ContentState(deliveryStatus: deliveryStatus, productName: productName, eta: eta)
        let futureDate: Date = .now + 3600
        let activityContent = ActivityContent(state: initialState,
                                              staleDate: futureDate)
        let attributes = DeliveryAttributes()
        do {
            let activity = try Activity.request(attributes: attributes,content: activityContent)
            return activity.id
        } catch {
            throw error
        }
    }
    
    static func updateActivity(activityId: String,
                               newDeliveryStatus: DeliveryStatus,
                               productName: String,
                               eta: String) async {
        let updateContentState = DeliveryAttributes.ContentState(deliveryStatus: newDeliveryStatus, productName: productName, eta: eta)
        let futureDate: Date = .now + 3600
        guard let activity = Activity<DeliveryAttributes>.activities.first(where: {$0.id == activityId}) else { return }
        let activityContent = ActivityContent(state: updateContentState,
                                              staleDate: futureDate)
        await activity.update(activityContent)
    }
    
    static func endActivity(activityId: String) async {
        guard let value = Activity<DeliveryAttributes>.activities.first(where: {$0.id == activityId}) else { return }
        await value.end(nil)

    }
}
