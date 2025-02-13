//
//  DemoMeshGradientView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoMeshGradientView: View {
    var body: some View {
        VStack {
            
            
            
            
            
            TimelineView(.animation) { timeline in
                let time = timeline.date.timeIntervalSince1970
                let x = (sin(time) * cos(time) + 1) / 2
                let y = (tan(time / 2) + sin(time) + 1) / 2
                
            }
        }
        .navigationTitle("Mesh Gradients")
    }
        
    @State private var shiftPosition = false
    
    private var meshRectangle: some View {
        Rectangle()
            .fill(
                
                
            )
            .frame(width: 300, height: 300)
    }
}

#Preview {
}
