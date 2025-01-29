//
//  SoundsLern.swift
//  LearnBasics
//
//  Created by Jaya Sabeen on 29/01/25.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing Sound - \(error.localizedDescription)")
        }
    }
    
    enum SoundOption: String {
        case tada
        case badum
    }
}

struct SoundsLern: View {
    var body: some View {
        VStack (spacing: 40) {
            Button("Play Sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Play Sound 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

#Preview {
    SoundsLern()
}
