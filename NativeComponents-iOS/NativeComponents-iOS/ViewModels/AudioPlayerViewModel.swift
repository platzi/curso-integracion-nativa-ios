//
//  PlayerView.swift
//  NativeComponents-iOS
//

import AVFoundation

class AudioPlayerViewModel: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    @Published var isPlaying: Bool = false
    
    init() {
        if let sound = Bundle.main.path(forResource: "audio", ofType: "mp3") {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            } catch {
                print("No se pudo inicializar el audio")
            }
        } else {
            print("No se pudo encontrar el archivo")
        }
    }
    
    func playOrPause() {
        guard let player = audioPlayer else { return }
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
}
