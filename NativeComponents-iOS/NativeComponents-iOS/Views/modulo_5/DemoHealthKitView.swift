//
//  DemoHealthKitView.swift
//  NativeComponents-iOS
//

import SwiftUI
import HealthKit

struct DemoHealthKitView: View {
    
    
    
    
    var body: some View {
        VStack {
            Text("Contador de pasos").font(.largeTitle)
            List {
                HStack {
                    Text("Pasos en los últimos 7 días:")
                    Spacer()
                    
                    
                }
                HStack {
                    Text("Pasos en esta mañana:")
                    Spacer()
                    
                    
                }
                HStack {
                    Text("Pasos en este día:")
                    Spacer()
                    
                    
                }
                HStack {
                    Text("Pasos desde el boot del dispositivo:")
                    Spacer()
                    
                    
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
        
    }
    
    private func getStepsFromThisMorning(_ statisticsColletion: HKStatisticsCollection) -> Void {
        
    }
    
    private func getStepsFromThisDay(_ statisticsColletion: HKStatisticsCollection) {
        
    }
    
    private func getStepsFromDeviceBoot(_ statisticsColletion: HKStatisticsCollection) {
        
    }
    
    private func initHealthKit() {
        
    }
}

#Preview {
    DemoHealthKitView()
}
