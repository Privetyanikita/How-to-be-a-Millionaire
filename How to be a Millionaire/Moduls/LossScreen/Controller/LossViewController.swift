//
//  LoseViewController.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 26.02.2024.
//
import SnapKit
import UIKit

class LossViewController: UIViewController {
    
    private let background: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "background1")
        return element
    } ()
    
    private let logo: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "logoImage")
        return element
    }()
    
    private let numbAttempt: UILabel = {
        let element = UILabel()
        element.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        element.text = "You losed on {attempt} attempt"
        element.font = UIFont.systemFont(ofSize: 24)
        return element
    }()
    
    private let loseLabel: UILabel = {
        let element = UILabel()
        element.textColor = UIColor(red: 246/255, green: 99/255, blue: 36/255, alpha: 1)
        element.text = "LOSE"
        element.font = UIFont.boldSystemFont(ofSize: 50)
        return element
    }()
    
    private let playAgainButton: UIButton = {
        let element = UIButton(type: .system)
        element.backgroundColor = UIColor(red: 52/255, green: 184/255, blue: 58/255, alpha: 1)
        element.setTitle("PLAY AGAIN", for: .normal)
        element.titleLabel?.font = UIFont.boldSystemFont(ofSize: 36)
        element.setTitleColor(.white, for: .normal)
        element.layer.cornerRadius = 20
        return element
    }()
    
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    private func setupViews(){
        view.addSubview(background)
        view.addSubview(logo)
        view.addSubview(numbAttempt)
        view.addSubview(playAgainButton)
    }
}

extension LossViewController{
    private func setupConstraints(){
        background.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        logo.snp.makeConstraints {maker in
            maker.top.equalTo(view.safeAreaLayoutGuide).inset(19)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(201)
            maker.height.equalTo(201)
        }
        
        numbAttempt.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(logo.snp.bottom).offset(5)
        }
        
        loseLabel.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(logo.snp.bottom).offset(47)
        }
        
        playAgainButton.snp.makeConstraints {maker in
            maker.centerX.equalToSuperview()
            maker.bottom.equalTo(view.safeAreaLayoutGuide).inset(84)
            maker.width.equalTo(300)
            maker.height.equalTo(100)
        }
    }
}

