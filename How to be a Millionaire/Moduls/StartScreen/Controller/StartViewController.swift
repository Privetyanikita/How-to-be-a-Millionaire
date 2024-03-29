//
//  StartViewController.swift
//  How to be a Millionaire
//

//  Created by NikitaKorniuk   on 26.02.2024.
//

import SnapKit
import UIKit

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.backgroundColor = .green
        initialize()
        GameMusicManager.shared.playSound(soundFileName: "bolee-kachestvennyiy-zvuk-mojet-on-vam-nujen-5284__=8.mp3")
    }
    
    private func initialize(){
        
        //background image
        let background = UIImageView()
        background.image = #imageLiteral(resourceName: "background1")
        
        view.addSubview(background)
        background.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        // logo millionaire
        let logo = UIImageView()
        logo.image = #imageLiteral(resourceName: "logoImage")
        
        view.addSubview(logo)
        logo.snp.makeConstraints {maker in
            maker.top.equalTo(view.safeAreaLayoutGuide).inset(41)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(225)
            maker.height.equalTo(225)
        }
        // Attempt label
        let numbAttempt = UILabel()
        numbAttempt.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        numbAttempt.text = "Welcome"
        numbAttempt.font = UIFont.systemFont(ofSize: 24)
        
        view.addSubview(numbAttempt)
        numbAttempt.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(logo.snp.bottom).offset(10)
            
        }
        // Name game label
        let nameGameLabel = UILabel()
        nameGameLabel.textColor = UIColor(white: 255, alpha: 1)
        
        nameGameLabel.text = "Who wants to be a millionaire?"
        nameGameLabel.font = UIFont.boldSystemFont(ofSize: 36)
        nameGameLabel.textAlignment = .center
        nameGameLabel.numberOfLines = 0
        
        view.addSubview(nameGameLabel)
        nameGameLabel.snp.makeConstraints {maker in
            maker.left.right.equalToSuperview() .inset(50)
            maker.top.equalTo(logo.snp.bottom).offset(47)
            
        }
        
        // Button GameRules
        let gameRules = UIButton(type: .system)
        gameRules.backgroundColor = UIColor.clear
        gameRules.setTitle("Game rules", for: .normal)
        gameRules.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        gameRules.setTitleColor(.green, for: .normal)
        gameRules.addTarget(self, action: #selector(rulesScreenTupped), for: .touchUpInside)
        
        
        view.addSubview(gameRules)
        gameRules.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(215)
            maker.height.equalTo(74)
            maker.top.equalTo(599)
        }
        
        // Button StartGame
        let startGame = UIButton(type: .system)
        startGame.backgroundColor = UIColor.clear
        startGame.setTitle("Start of game", for: .normal)
        startGame.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        startGame.setTitleColor(.green, for: .normal)
        
        startGame.addTarget(self, action: #selector(goToGame), for: .touchUpInside)
        
        view.addSubview(startGame)
        startGame.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(215)
            maker.height.equalTo(74)
            maker.top.equalTo(519)
        }
        
        
    }

    @objc private func rulesScreenTupped(){
        let vc = RulesViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc private func goToGame(){
        let vc = MainViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}
