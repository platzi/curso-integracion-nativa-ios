//
//  CameraView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct CameraView: View {
    var image: CGImage?
    private let label = Text("frame")
    
    var body : some View {
        if let image = image {
            Image(image, scale: 1.0, orientation: .up, label: label)
        } else {
            Color.red
        }
    }
}
