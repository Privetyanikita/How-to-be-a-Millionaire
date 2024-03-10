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
                    
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            music = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                
            guard let music = music else { return }
                music.play()
        } catch let error {
            print(error.localizedDescription)
            }
    }
    func stopSound() {
        music?.stop()
    }
}
