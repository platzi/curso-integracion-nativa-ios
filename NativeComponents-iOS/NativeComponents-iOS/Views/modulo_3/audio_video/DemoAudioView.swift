//
//  AudioView.swift
//  NativeComponents-iOS
//

import SwiftUI

struct DemoAudioView: View {
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()
    
    var body: some View {
        VStack {
            Button(action: {
                audioPlayerViewModel.playOrPause()
            }) {
                Image(systemName: audioPlayerViewModel.isPlaying ? "pause.circle" : "play.circle")
                    .resizable()
                    .frame(width: 64, height: 64)
            }

       }
    }
}

#Preview {
    DemoAudioView()
}
