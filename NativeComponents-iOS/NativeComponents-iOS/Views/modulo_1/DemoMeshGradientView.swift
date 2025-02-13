//
//  DemoMeshGradientView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoMeshGradientView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 300, height: 300)
                .clipShape(.rect(cornerRadius: 15))
            meshRectangle
            TimelineView(.animation) { timeline in
                let time = timeline.date.timeIntervalSince1970
                let x = (sin(time) * cos(time) + 1) / 2
                let y = (tan(time / 2) + sin(time) + 1) / 2
                Circle()
                    .fill(
                        MeshGradient(
                            width: 3, height: 3,
                            points: [
                                .init(0, 0), .init(0.5, 0), .init(1, 0),
                                .init(0, 0.5), .init(Float(x), Float(y)), .init(1, 0.5),
                                .init(0, 1), .init(0.5, 1), .init(1, 1),
                            ],
                            colors: [
                                .cyan, .blue, .red,
                                .yellow, .green, .purple,
                                .orange, .pink, .brown
                            ]
                        )
                    )
            }
        }
        .navigationTitle("Mesh Gradients")
    }
        
    @State private var shiftPosition = false
    
    private var meshRectangle: some View {
        Rectangle()
            .fill(
                MeshGradient(
                    width: 3, height: 3,
                    points: [
                        .init(0, 0), .init(0.5, 0), .init(1, 0),
                        .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
                        .init(0, 1), .init(0.5, 1), .init(1, 1),
                    ],
                    colors: [
                        .cyan, .blue, .red,
                        .yellow, .green, .purple,
                        .orange, .pink, .brown
                    ]
                )
            )
            .frame(width: 300, height: 300)
    }
}

#Preview {
}
