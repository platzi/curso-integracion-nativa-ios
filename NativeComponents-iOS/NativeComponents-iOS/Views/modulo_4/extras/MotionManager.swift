//
//  MotioManager.swift
//  NativeComponents-iOS
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    private var motion = CMMotionManager()
    private var timer: Timer?
    
    @Published var accelerationX: Double = 0.0
    @Published var accelerationY: Double = 0.0
    @Published var accelerationZ: Double = 0.0
    
    func startUpdates() {
        if motion.isAccelerometerAvailable {
            motion.accelerometerUpdateInterval = 0.1
            motion.startAccelerometerUpdates()
            
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
                if let data = self?.motion.accelerometerData {
                    DispatchQueue.main.async {
                        self?.accelerationX = data.acceleration.x
                        self?.accelerationY = data.acceleration.y
                        self?.accelerationZ = data.acceleration.z
                    }
                }
            }
        } else {
            print("Acelerometro no disponible")
        }
    }
    
    func stopUpdates() {
        motion.stopAccelerometerUpdates()
        timer?.invalidate()
    }
}
