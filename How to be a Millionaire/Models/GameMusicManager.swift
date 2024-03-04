//
//  GameMusicManager.swift
//  How to be a Millionaire
//
//  Created by deshollow on 04.03.2024.
//

import AVFoundation

class GameMusicManager {
    
    static let shared = GameMusicManager()
    private var music: AVAudioPlayer?
    
    private init() {}
    
    func playSound(soundFileName: String) {
        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: "mp3") else { return }
        music = try! AVAudioPlayer(contentsOf: url)
        music?.volume = 0.5
        music?.play()
    }
    func stopSound() {
        music?.stop()
    }
}
