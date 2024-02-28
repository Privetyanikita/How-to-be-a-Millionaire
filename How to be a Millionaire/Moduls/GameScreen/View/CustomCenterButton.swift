//
//  CustomButton.swift
//  How to be a Millionaire
//
//  Created by deshollow on 27.02.2024.
//

import UIKit
import SnapKit

final class CustomCenterButton: UIButton {
    
    let charForAnswerLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 24, weight: .semibold)
        element.textColor = UIColor(red: 255/255,
                                    green: 255/255,
                                    blue: 255/255,
                                    alpha: 1)
        return element
    }()
    
    let questionAnswerLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 24, weight: .semibold)
        element.textColor = UIColor(red: 255/255,
                                    green: 255/255,
                                    blue: 255/255,
                                    alpha: 1)
        element.textAlignment = .right
        element.numberOfLines = 2
        element.adjustsFontSizeToFitWidth = true
        element.minimumScaleFactor = 0.3
        
        return element
    }()
    
    let questionButtonImage: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleToFill
        element.image = UIImage(named: "blueButton")
        element.clipsToBounds = true
        return element
    }()
    
    init(char: String, answer: String) {
        super.init(frame: .zero)
        self.charForAnswerLabel.text = char
        self.questionAnswerLabel.text = answer
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 2
        self.layer.borderColor = CGColor(gray: 1, alpha: 1)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        [questionButtonImage, charForAnswerLabel, questionAnswerLabel].forEach { self.addSubview($0) }
    }
    private func setupConstraints() {
        questionButtonImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        charForAnswerLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.bottom.equalToSuperview()
        }
        questionAnswerLabel.snp.makeConstraints { make in
            make.leading.equalTo(charForAnswerLabel).offset(15)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(13)
            make.bottom.equalToSuperview().inset(13)
        }
    }
}

//done for custom button
