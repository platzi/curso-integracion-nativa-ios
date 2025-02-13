//
//  VideoView.swift
//  NativeComponents-iOS
//

import SwiftUI
import AVKit

struct DemoVideoView: View {
    @State private var player = AVPlayer()
    
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .edgesIgnoringSafeArea(.all)
                .onAppear() {
                    let url = URL(string: "https://github.com/lizarragadev/lizarragadev/raw/refs/heads/main/Deadpool%20&%20Wolverine%20%20Tra%CC%81iler%20Oficial%20%20Doblado%20-%20Marvel%20Latinoame%CC%81rica%20Oficial%20(720p,%20h264,%20youtube).mp4")
                    player = AVPlayer(url: url!)
                    player.play()
                }
                .onDisappear {
                    player.pause()
                }
        }.navigationTitle("Video")
    }
}
