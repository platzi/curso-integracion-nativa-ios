//
//  DemoMapKit.swift
//  NativeComponents-iOS
//

import SwiftUI
import MapKit

struct DemoMapKit: View {
    let platzi = CLLocationCoordinate2D(
        latitude: 4.654808,
        longitude: -74.0561605)
    let hippiePark = CLLocationCoordinate2D(
        latitude: 4.645564,
        longitude: -74.061984)
    let lourdesPark = CLLocationCoordinate2D(
        latitude: 4.649367,
        longitude: -74.061684)
    @State var camera: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $camera) {
            Marker(
                "Bogotá",
                coordinate: CLLocationCoordinate2D(
                    latitude: 4.654607,
                    longitude: -74.063012
                )
            )
            Annotation("Platzi", coordinate: platzi) {
                Image("ic_platzi")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .font(.title)
                    .foregroundColor(.red)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
            }
            Annotation("Parque de los Hippies", coordinate: hippiePark) {
                Image("ic_park")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .font(.title)
                    .foregroundColor(.red)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
            }
            Annotation("Parque de Lourdes", coordinate: lourdesPark) {
                Image("ic_park")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .font(.title)
                    .foregroundColor(.red)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
            }
        }
        .mapStyle(.standard)
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                Button{
                    camera = .region(MKCoordinateRegion(center: platzi, latitudinalMeters: 200, longitudinalMeters: 200))
                } label: {
                    Text("Platzi")
                        .fontWeight(Font.Weight.bold)
                }.padding(.horizontal)
                Spacer()
                Button{
                    camera = .region(MKCoordinateRegion(center: hippiePark, latitudinalMeters: 200, longitudinalMeters: 200))
                } label: {
                    Text("Parque de los Hippies")
                        .fontWeight(Font.Weight.bold)
                }.padding(.horizontal)
                Spacer()
                Button{
                    camera = .region(MKCoordinateRegion(center: lourdesPark, latitudinalMeters: 200, longitudinalMeters: 200))
                } label: {
                    Text("Parque de Lourdes")
                        .fontWeight(Font.Weight.bold)
                }.padding(.horizontal)
                Spacer()
            }
            .padding(.top)
            .background(.thinMaterial)
        }
    }
}

