//
//  View.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.
//

import UIKit
import SnapKit

final class GameView: UIViewController {
    
    private let topLabelTexts = [
        "On which rock was started the history of United Statesby disembarkaiton on it by Mayflower Piligrms?",
        "What year was the year, when first deodorant was invented in our life?",
        "Traditonal Chinese painting technique is...",
        "Who made the first New York electricity system?",
        "Why the Cold War was ended?",
    ]
    private let questionTexts = [
        "Вопрос 1", "Вопрос 2", "Вопрос 3", "Вопрос 4", "Вопрос 5", "Вопрос 6"
    ]
    private let moneyTexts = [
        "100 RUB", "250 RUB", "500 RUB", "1000 RUB", "2000 RUB", "5000 RUB"
    ]
    private let aBcDs = ["A", "B", "C", "D"]
    private let buttonQuestions = ["Plymouth", "Washington", "Thaiwan", "Australia", "1956",
                                   "1912", "1942", "1930", "sabii", "gohua", "rinoyo", "jinkugo",
                                   "Nicola Tesla", "Wodrow Wilson", "Thomas Edisson", "Eugene Polly",
                                   "Soviet Union wants to work with countries abroad", "President of USA died",
                                   "It was a revolution in Germany", "Secret Union was made a dicision"
    ]
    private let buttonAcustom = CustomCenterButton(char: "A", answer: "Plymouth")
    private let buttonBcustom = CustomCenterButton(char: "B", answer: "Washington")
    private let buttonCcustom = CustomCenterButton(char: "C", answer: "Thaiwan")
    private let buttonDcustom = CustomCenterButton(char: "D", answer: "Australia")
    
    private let buttonFiftyFifty = CustomBottomButton(image: "help50:50Image")
    private let buttonCallAFriend = CustomBottomButton(image: "callFriendImage")
    private let buttonHelpAudience = CustomBottomButton(image: "helpAudienceImage")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignViewBackground()
        assignViewElements()
    }
    //MARK: Background Settings
    
    private func assignViewBackground() {
        let background = UIImage(named: "background3")
        var imageView: UIImageView!
        
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    //MARK: Top Logo Image
    
    private func assignViewElements() {
        
        let logo = UIImageView()
        
        logo.image = UIImage(named: "logoImage")
        logo.contentMode = .scaleAspectFit
        view.addSubview(logo)
        logo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(19)
            make.left.equalToSuperview().offset(18)
            make.width.equalTo(87)
            make.height.equalTo(87)
        }
        //MARK: Top Question Label
        
        let topLabel = UILabel()
        
        topLabel.text = topLabelTexts.first
        topLabel.textColor = UIColor(red: 255/255,
                                     green: 255/255,
                                     blue: 255/255,
                                     alpha: 1)
        topLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        topLabel.numberOfLines = 0
        view.addSubview(topLabel)
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(9)
            make.right.equalToSuperview().offset(7)
            make.width.equalTo(281)
            make.height.equalTo(126)
        }
        //MARK: Top Number of Qeustion Label
        
        let numberOfquestionLabel = UILabel()
        
        numberOfquestionLabel.text = questionTexts.first
        numberOfquestionLabel.textColor = UIColor(red: 255/255,
                                                  green: 255/255,
                                                  blue: 255/255,
                                                  alpha: 1)
        numberOfquestionLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        view.addSubview(numberOfquestionLabel)
        numberOfquestionLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(27)
            make.width.equalTo(121)
            make.height.equalTo(46)
        }
        //MARK: Top Money Label
        
        let moneyLabel = UILabel()
        
        moneyLabel.text = moneyTexts.first
        moneyLabel.textColor = UIColor(red: 255/255,
                                       green: 255/255,
                                       blue: 255/255,
                                       alpha: 1)
        moneyLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        view.addSubview(moneyLabel)
        moneyLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(14)
            make.right.equalToSuperview()
            make.width.equalTo(114)
            make.height.equalTo(45)
        }
        //MARK: Center Buttons
        
        view.addSubview(buttonAcustom)
        buttonAcustom.snp.makeConstraints { make in
            make.top.equalTo(moneyLabel.snp.bottom).offset(23)
            make.right.equalToSuperview().inset(33)
            make.width.equalTo(321)
            make.height.equalTo(54)
        }
        view.addSubview(buttonBcustom)
        buttonBcustom.snp.makeConstraints { make in
            make.width.equalTo(buttonAcustom)
            make.height.equalTo(buttonAcustom)
            make.left.right.equalTo(buttonAcustom)
            make.top.equalTo(buttonAcustom.snp.bottom).offset(30)
        }
        view.addSubview(buttonCcustom)
        buttonCcustom.snp.makeConstraints { make in
            make.width.equalTo(buttonBcustom)
            make.height.equalTo(buttonBcustom)
            make.left.right.equalTo(buttonBcustom)
            make.top.equalTo(buttonBcustom.snp.bottom).offset(30)
        }
        view.addSubview(buttonDcustom)
        buttonDcustom.snp.makeConstraints { make in
            make.width.equalTo(buttonCcustom)
            make.height.equalTo(buttonCcustom)
            make.left.right.equalTo(buttonCcustom)
            make.top.equalTo(buttonCcustom.snp.bottom).offset(30)
        }
        //MARK: Bottom Buttons
        
        view.addSubview(buttonFiftyFifty)
        buttonFiftyFifty.snp.makeConstraints { make in
            make.left.equalTo(numberOfquestionLabel)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(59)
        }
        view.addSubview(buttonCallAFriend)
        buttonCallAFriend.snp.makeConstraints { make in
            make.left.equalTo(buttonFiftyFifty.snp.right).offset(88)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(59)
        }
        view.addSubview(buttonHelpAudience)
        buttonHelpAudience.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(59)
        }
        
    }
}
