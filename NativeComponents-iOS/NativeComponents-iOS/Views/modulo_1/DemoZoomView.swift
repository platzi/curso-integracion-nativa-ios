//
//  DemoZoomView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoZoomView: View {
    
    @Namespace var zoomExampleNamespace
    @State private var transitionID: String = "id"

    var body: some View {
        VStack(spacing: 10.0) {
            
        }
        .navigationTitle("Zoom Transitions")
    }
}
    
#Preview {
    NavigationStack {
        DemoZoomView()
    }
}
