//
//  DemoGeoChangeView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoGeoChangeView: View {
    @State private var topCircleHeight = 30.0
    @State private var bottomCircleHeight = 15.0
    
    var body: some View {
        ScrollView {
            VStack {
                GroupBox {
                    HStack {
                        Text("Circle Size:")
                        Text(String(format: "%.2f", topCircleHeight))
                            .contentTransition(.numericText(value: topCircleHeight))
                            .animation(.smooth, value: topCircleHeight)
                        Spacer()
                    }
                    Slider(value: $topCircleHeight, in: 30...200) {
                        EmptyView()
                    } minimumValueLabel: {
                        Text("30")
                    } maximumValueLabel: {
                        Text("200")
                    }
                    
                    
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Geometry Change Examples")
    }
}

#Preview {
}
