//
//  GameMusicManager.swift
//  How to be a Millionaire
//
//  Created by deshollow on 04.03.2024.
//

import AVFoundation

class GameMusicManager {
    
    static let shared = GameMusicManager()
    private var misic: AVAudioPlayer?
    
    private init() {}
    
    func playSound(soundFileName: String) {
        guard let url = Bundle.main.url(forResource: soundFileName, withExtension: "mp3") else { return }
        misic = try! AVAudioPlayer(contentsOf: url)
        misic?.play()
    }
    func stopSound() {
        misic?.stop()
    }
}
