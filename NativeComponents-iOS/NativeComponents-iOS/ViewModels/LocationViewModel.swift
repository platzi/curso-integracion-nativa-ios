//
//  LocalizationViewModel.swift
//  NativeComponents-iOS
//

import Foundation
import CoreLocation

class LocationViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var location: CLLocationCoordinate2D?
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        DispatchQueue.main.async {
            self.location = location.coordinate
        }
    }
    
}
