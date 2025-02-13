//
//  DemoCameraView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoCameraView: View {
    @StateObject private var model = CameraHandler()
    
    var body: some View {
        CameraView(image: model.frame)
            .ignoresSafeArea()
    }
}

#Preview {
    DemoCameraView()
}
