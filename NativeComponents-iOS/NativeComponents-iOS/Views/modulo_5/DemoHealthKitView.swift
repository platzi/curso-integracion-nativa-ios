//
//  DemoHealthKitView.swift
//  NativeComponents-iOS
//

import SwiftUI
import HealthKit

struct DemoHealthKitView: View {
    private var healthStore: HealthStore?
    @State private var stepsLastSevenDays: Double = 0.0
    @State private var stepsThisMorning: Double = 0.0
    @State private var stepsFromBoot: Double = 0.0
    @State private var stepsThisDay: Double = 0.0
    
    init() {
        healthStore = HealthStore()
    }
    
    var body: some View {
        VStack {
            Text("Contador de pasos").font(.largeTitle)
            List {
                HStack {
                    Text("Pasos en los últimos 7 días:")
                    Spacer()
                    Text("\(stepsLastSevenDays, specifier: "%.0f")")
                        .padding()
                }
                HStack {
                    Text("Pasos en esta mañana:")
                    Spacer()
                    Text("\(stepsThisMorning, specifier: "%.0f")")
                        .padding()
                }
                HStack {
                    Text("Pasos en este día:")
                    Spacer()
                    Text("\(stepsThisDay, specifier: "%.0f")")
                        .padding()
                }
                HStack {
                    Text("Pasos desde el boot del dispositivo:")
                    Spacer()
                    Text("\(stepsFromBoot, specifier: "%.0f")")
                        .padding()
                }
            }
        }
        .onAppear {
            initHealthKit()
        }
        .refreshable {
            initHealthKit()
        }
    }
    
    private func getStepsFromLastSevenDays(_ statisticsColletion: HKStatisticsCollection) -> Void {
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let endDate = Date()
        
        stepsLastSevenDays = 0.0
        
        statisticsColletion.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            guard let count = count else {
                return
            }
            stepsLastSevenDays += count
        }
    }
    
    private func getStepsFromThisMorning(_ statisticsColletion: HKStatisticsCollection) -> Void {
        guard let startDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) else { return }
        guard let endDate = Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: startDate) else { return }
        
        stepsThisMorning = 0.0
        
        statisticsColletion.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            guard let count = count else {
                return
            }
            stepsThisMorning += count
        }
    }
    
    private func getStepsFromThisDay(_ statisticsColletion: HKStatisticsCollection) {
        guard let startDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()) else { return }
        guard let endDate = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: startDate) else { return }
        
        stepsThisDay = 0.0
        
        statisticsColletion.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            guard let count = count else {
                return
            }
            stepsThisDay += count
        }
    }
    
    private func getStepsFromDeviceBoot(_ statisticsColletion: HKStatisticsCollection) {
        guard let bootTime = Calendar.current.date(byAdding: .second, value: Int(-ProcessInfo.processInfo.systemUptime), to: Date()) else { return }
        
        stepsFromBoot = 0.0
        
        statisticsColletion.enumerateStatistics(from: bootTime, to: Date()) { statistics, stop in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            guard let count = count else {
                return
            }
            stepsFromBoot += count
        }
    }
    
    private func initHealthKit() {
        if let healthStore = healthStore {
            healthStore.requestAuthorization { success in
                if success {
                    healthStore.calculateSteps { statisticCollection in
                        if let statisticCollection = statisticCollection {
                            getStepsFromLastSevenDays(statisticCollection)
                            getStepsFromThisMorning(statisticCollection)
                            getStepsFromThisDay(statisticCollection)
                            getStepsFromDeviceBoot(statisticCollection)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    DemoHealthKitView()
}
