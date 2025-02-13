//
//  ModuloTresView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct ModuloTresView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        NavigationLink("Cámara") {
                            DemoCameraView()
                        }
                        NavigationLink("Galería") {
                            DemoGalleryView()
                        }
                        NavigationLink("Audio y Video") {
                            DemoAudioVideoView()
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
}

#Preview {
    ModuloTresView()
}
