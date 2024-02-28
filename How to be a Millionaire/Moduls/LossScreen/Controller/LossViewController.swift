//
//  LoseViewController.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 26.02.2024.
//
import SnapKit
import UIKit

class LossViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        initialize()
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
            maker.top.equalTo(view.safeAreaLayoutGuide).inset(19)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(201)
            maker.height.equalTo(201)
        }

        // Attempt label
        let numbAttempt = UILabel()
        numbAttempt.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        numbAttempt.text = "You losed on {attempt} attempt"
        numbAttempt.font = UIFont.systemFont(ofSize: 24)

        view.addSubview(numbAttempt)
        numbAttempt.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(logo.snp.bottom).offset(5)

        }

        // LOSE label
        let loseLabel = UILabel()
        loseLabel.textColor = UIColor(red: 246/255, green: 99/255, blue: 36/255, alpha: 1)

        loseLabel.text = "LOSE"
        loseLabel.font = UIFont.boldSystemFont(ofSize: 50)


        view.addSubview(loseLabel)
        loseLabel.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(logo.snp.bottom).offset(47)
        }

        // Button PlayAgain
        let playAgainButton = UIButton(type: .system)
        playAgainButton.backgroundColor = UIColor(red: 52/255, green: 184/255, blue: 58/255, alpha: 1)
        playAgainButton.setTitle("PLAY AGAIN", for: .normal)
        playAgainButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        playAgainButton.setTitleColor(.white, for: .normal)
        playAgainButton.layer.cornerRadius = 20

        view.addSubview(playAgainButton)
        playAgainButton.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.bottom.equalTo(view.safeAreaLayoutGuide).inset(84)
            maker.width.equalTo(300)
            maker.height.equalTo(100)

        }

    }
}

