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
            NavigationLink {
                VStack {
                    Text("Contenido")
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .navigationTransition(
                    .zoom(
                        sourceID: transitionID,
                        in: zoomExampleNamespace
                    )
                )
            } label: {
                Text("Abrir pantalla")
                    .padding(.all, 10)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .matchedTransitionSource(id: transitionID, in: zoomExampleNamespace)
        }
        .navigationTitle("Zoom Transitions")
    }
}
    
#Preview {
    NavigationStack {
        DemoZoomView()
    }
}
