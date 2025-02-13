//
//  DemoAudioVideoView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoAudioVideoView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Form {
                    Section {
                        NavigationLink("Audio") {
                            DemoAudioView()
                        }
                        NavigationLink("Video") {
                            DemoVideoView()
                        }
                    }
                    .padding(15)
                }
            }
        }
    }
}
