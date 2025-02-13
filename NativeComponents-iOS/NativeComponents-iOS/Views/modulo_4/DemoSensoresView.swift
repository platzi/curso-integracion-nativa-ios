//
//  DemoSensoresView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoSensoresView: View {
    @StateObject private var motionManager = MotionManager()
    
    var body: some View {
        VStack {
            Text("Acelerómetro")
                .font(.largeTitle)
            Text("X: \(motionManager.accelerationX, specifier: "%.2f")")
            Text("Y: \(motionManager.accelerationY, specifier: "%.2f")")
            Text("Z: \(motionManager.accelerationZ, specifier: "%.2f")")
            
        }
        .padding()
        .onAppear {
            motionManager.startUpdates()
        }
        .onDisappear {
            motionManager.stopUpdates()
        }
        
    }
}

#Preview {
    DemoSensoresView()
}
