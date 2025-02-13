//
//  DemoLocalization.swift
//  NativeComponents-iOS
//

import SwiftUI
import MapKit

struct DemoLocalization: View {
    @StateObject var locationViewModel = LocationViewModel()
    let ubicacion = CLLocationCoordinate2D(
        latitude: 4.654808,
        longitude: -74.0561605)
    
    var body: some View {
        ZStack {
            Map {
                Marker(
                    "Ubicación",
                    coordinate: locationViewModel.location ?? ubicacion
                )
            }
            .safeAreaInset(
                edge: .bottom) {
                    HStack {
                        Spacer()
                        VStack {
                            Text("Latitud: \(locationViewModel.location?.latitude ?? ubicacion.latitude)")
                            Text("Longitud: \(locationViewModel.location?.longitude ?? ubicacion.longitude)")
                            
                        }
                        Spacer()
                    }
                    .padding(.top)
                    .background(.thinMaterial)
                }
        }
        
        
        
        
        
    }
}
