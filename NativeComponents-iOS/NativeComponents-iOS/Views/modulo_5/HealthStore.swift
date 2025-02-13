//
//  HelathManager.swift
//  NativeComponents-iOS
//

import Foundation
import HealthKit

class HealthStore {
    var healtStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healtStore = HKHealthStore()
        }
    }
    
    func calculateSteps(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        
        let anchorDate = Calendar(identifier: .iso8601)
            .date(from: Calendar(identifier: .iso8601)
                .dateComponents([.yearForWeekOfYear, .weekOfYear],
                                from: Date()
                               )
            )!
        
        let daily = DateComponents(day: 1)
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        
        query = HKStatisticsCollectionQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: anchorDate, intervalComponents: daily)
        
        query!.initialResultsHandler = { query, statisticsColletion, error in
            completion(statisticsColletion)
        }
        
        if let healtStore = healtStore, let query = self.query {
            healtStore.execute(query)
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        
    }
}
