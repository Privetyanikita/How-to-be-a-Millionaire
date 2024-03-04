//
//  ViewController.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.
//

import UIKit
import SnapKit
import AVFoundation

final class GameViewController: UIViewController {
    
    //MARK: - Properties
    private let logo: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "logoImage")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let topLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor(red: 255/255,
                                 green: 255/255,
                                 blue: 255/255,
                                 alpha: 1)
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        view.numberOfLines = 0
        return view
    }()
    
    private let numberOfquestionLabel: UILabel = {
        let view = UILabel()
        
        view.textColor = UIColor(red: 255/255,
                                 green: 255/255,
                                 blue: 255/255,
                                 alpha: 1)
        view.font = .systemFont(ofSize: 24, weight: .semibold)
        return view
    }()
    
    private let moneyLabel:  UILabel = {
        let view = UILabel()
        
        view.textColor = UIColor(red: 255/255,
                                 green: 255/255,
                                 blue: 255/255,
                                 alpha: 1)
        view.font = .systemFont(ofSize: 24, weight: .semibold)
        return view
    }()
    
    private let gameView = GameView()
    
    private var questionIndex = 0
    private var questions = Source().questionsArray
    
    private var moneyIndex = 0
    private let moneys = MoneySource().moneyArray
    
    private var timer: Timer?
    
    private let buttonFiftyFifty = CustomBottomButton(image: "help50:50Image")
    private let buttonCallAFriend = CustomBottomButton(image: "callFriendImage")
    private let buttonHelpAudience = CustomBottomButton(image: "helpAudienceImage")
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        GameMusicManager.shared.playSound(soundFileName: "zvuk-chasov-vo-vremya-igryi-kto-hochet-stat-millionerom-kogda-igrok-dumaet-nad-voprosom-43473-1%3F_%3D1.mp3")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        setupBackground()
        setupViews()
        setupConstraints()
        setupQuestion()
        
        setupFiftyFiftyButtonTouch()
        setupCallAFriendButtonTouch()
        setupHelpAudienceButtonTouch()
        
        areBottomButtonsTrue()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        timer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: false) { [weak self] timer in
            self?.youLose()
        }
    }
    
    //MARK: - Private methods
    
    private func setupViews() {
        
        gameView.onSelectAnswer = { [weak self] idx in
            self?.selectAnswer(idx: idx)
        }
        
        view.addSubview(logo)
        view.addSubview(topLabel)
        view.addSubview(numberOfquestionLabel)
        view.addSubview(moneyLabel)
        view.addSubview(gameView)
        view.addSubview(buttonFiftyFifty)
        view.addSubview(buttonCallAFriend)
        view.addSubview(buttonHelpAudience)
    }
    
    private func setupBackground() {
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
    
    private func setupQuestion() {
        if curanceQuestionStructStatic.question >= 0 && curanceQuestionStructStatic.question < questions.count {
            let currentQuestion = questions[curanceQuestionStructStatic.question]
            topLabel.text = currentQuestion.question
            numberOfquestionLabel.text = "Question \(curanceQuestionStructStatic.question + 1)"
            gameView.update(with: currentQuestion.answers)
        }
        
        if curanceQuestionStructStatic.money >= 0 && curanceQuestionStructStatic.money < moneys.count {
            let currentMoney = moneys[curanceQuestionStructStatic.money]
            moneyLabel.text = currentMoney.money
        }
    }
    
    //MARK: Select Answer method
    
    private func selectAnswer(idx: Int) {
        guard questionIndex < questions.count else { return }
        let currentQuestion = questions[curanceQuestionStructStatic.question]
        
        let answer = currentQuestion.answers[idx]
        
        gameView.updateButton(idx: idx, isCorrect: answer.isCorrect)
        
        if answer.isCorrect {
            questionIndex += 1
            moneyIndex += 1
            unAlphaButton()
            GameMusicManager.shared.playSound(soundFileName: "otvet-vernyiy-5267__=2.mp3")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // переход назад к списку вопросов и сохранение № вопроса в синглтон
                
                // В случае правильного ответа
                curanceQuestionStructStatic.answerCorrect()
                let questioniewController = QuestionListViewController()
                questioniewController.modalPresentationStyle = .fullScreen
                self.present(questioniewController, animated: true, completion: nil)
            }
        } else {
            print("You lose Screen!")
            GameMusicManager.shared.playSound(soundFileName: "zvuk-nepravilnogo-otveta-vkto-hochet-stat-millionerom-5270__=6.mp3")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // переход назад к списку вопросов
                
                // В случае неправильного ответа
                curanceQuestionStructStatic.answerIncorrect()
                let questioniewController = QuestionListViewController()
                questioniewController.modalPresentationStyle = .fullScreen
                self.present(questioniewController, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: Lose Timer
    
    private func youLose() {
        timer?.invalidate()
        timer = nil
        
        print("Dismiss to Question Screen!")
        let lossViewController = LossViewController()
        lossViewController.modalPresentationStyle = .fullScreen
        self.present(lossViewController, animated: true, completion: nil)
    }
    
    //MARK: Fifty Figty Button logic
    
    private func setupFiftyFiftyButtonTouch() {
        buttonFiftyFifty.addTarget(self, action: #selector(buttonFiftyFiftyAction), for: .touchUpInside)
    }
    
    @objc func buttonFiftyFiftyAction() {
        
        if BottomButtonStaticManager.fiftyFiftyButton == false {
            BottomButtonStaticManager.fiftyFiftyButton = true
            buttonFiftyFifty.bottomButtonImage.image = UIImage(named: "help50:50ImageCross")
            
            var buttonsArray = gameView.answerButtons
            buttonsArray.remove(at: 0)
            buttonsArray.remove(at: Int.random(in: 0..<buttonsArray.count))
            
            for button in buttonsArray {
                button.alpha = 0.5
            }
        }
    }
    
    //MARK: Call a Friend Button logic
    
    private func setupCallAFriendButtonTouch() {
        buttonCallAFriend.addTarget(self, action: #selector(buttonCallAFriendAction), for: .touchUpInside)
    }
    
    @objc func buttonCallAFriendAction() {
        
        if BottomButtonStaticManager.callAFriendButton == false {
            BottomButtonStaticManager.callAFriendButton = true
            
            buttonCallAFriend.bottomButtonImage.image = UIImage(named: "callFriendImageCross")
            var buttonsArray = gameView.answerButtons
            buttonsArray.remove(at: 0)
            buttonsArray.remove(at: Int.random(in: 0..<buttonsArray.count))
            
            for button in buttonsArray {
                button.alpha = 0.5
            }
        }
    }
    
    //MARK: Help from Button logic
    
    private func setupHelpAudienceButtonTouch() {
        buttonHelpAudience.addTarget(self, action: #selector(buttonHelpAudienceAction), for: .touchUpInside)
    }
    
    @objc func buttonHelpAudienceAction() {
        
        if BottomButtonStaticManager.helpAudienctButton == false {
            BottomButtonStaticManager.helpAudienctButton = true
            
            buttonHelpAudience.bottomButtonImage.image = UIImage(named: "helpAudienceImageCross")
            var buttonsArray = gameView.answerButtons
            buttonsArray.remove(at: 0)
            
            for button in buttonsArray {
                button.alpha = 0.5
            }
        }
    }
    
    private func unAlphaButton(){
        for button in gameView.answerButtons {
            button.alpha = 1
        }
    }
    
    //MARK: Are Bottom Buttons true?
    
    private func areBottomButtonsTrue() -> Void {
        if BottomButtonStaticManager.fiftyFiftyButton {
            buttonFiftyFifty.bottomButtonImage.image = UIImage(named: "help50:50ImageCross")
        }
        
        if BottomButtonStaticManager.callAFriendButton {
            buttonCallAFriend.bottomButtonImage.image = UIImage(named: "callFriendImageCross")
        }
        
        if BottomButtonStaticManager.helpAudienctButton {
            buttonHelpAudience.bottomButtonImage.image = UIImage(named: "helpAudienceImageCross")
        }
        
    }
}

//MARK: - GameView: - Extensions

extension GameViewController {
    private func setupConstraints() {
        logo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(19)
            make.left.equalToSuperview().offset(18)
            make.width.equalTo(87)
            make.height.equalTo(87)
        }
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(9)
            make.right.equalToSuperview().inset(7)
            make.width.equalTo(261)
            make.height.equalTo(126)
            
        }
        numberOfquestionLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(27)
            make.width.equalTo(121)
            make.height.equalTo(46)
        }
        moneyLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(14)
            make.right.equalToSuperview()
            make.width.equalTo(114)
            make.height.equalTo(45)
        }
        gameView.snp.makeConstraints { make in
            make.top.equalTo(moneyLabel.snp.bottom).offset(14)
            make.bottom.equalTo(buttonFiftyFifty.snp.top).offset(-14)
            make.right.equalToSuperview().inset(27)
            make.left.equalToSuperview().inset(27)
        }
        buttonFiftyFifty.snp.makeConstraints { make in
            make.left.equalTo(numberOfquestionLabel)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(59)
        }
        buttonCallAFriend.snp.makeConstraints { make in
            make.left.equalTo(buttonFiftyFifty.snp.right).offset(13)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(59)
        }
        buttonHelpAudience.snp.makeConstraints { make in
            make.right.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(59)
        }
        
    }
}













