//
//  DemoColorBlendView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoColorBlendView: View {
    @State private var colorOne: Color = Color.green
    @State private var colorTwo: Color = Color.blue
    
    var body: some View {
        VStack {
            TimelineView(.animation) { timeline in
                let time = timeline.date.timeIntervalSince1970
                let mix = (sin(time) + 1)/2
                RoundedRectangle(cornerRadius: 8)
                    .fill(colorOne.mix(with: colorTwo, by: mix))
                    .frame(width: 400, height: 800)
                
            }
        }
        .navigationTitle("Color Blend Examples")
    }
}

#Preview {
    DemoColorBlendView()
}
