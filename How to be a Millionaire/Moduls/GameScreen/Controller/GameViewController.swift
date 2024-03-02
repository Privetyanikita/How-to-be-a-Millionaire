//
//  ViewController.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.
//

import UIKit
import SnapKit

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
    
    private let gameView = GameView()
    
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
    
    private var questionIndex = 0
    private var questions = Source().questionsArray
    
    private var moneyIndex = 0
    private let moneys = MoneySource().moneyArray
    
    private var timer: Timer?
    
    private let buttonFiftyFifty = CustomBottomButton(image: "help50:50Image")
    private let buttonCallAFriend = CustomBottomButton(image: "callFriendImage")
    private let buttonHelpAudience = CustomBottomButton(image: "helpAudienceImage")
    
    
    
    
    //MARK: - Lifecycle
    
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
        guard questionIndex < questions.count else { return }
        let currentQuestion = questions[questionIndex]
        topLabel.text = currentQuestion.question
        numberOfquestionLabel.text = "\(questionIndex + 1) Question"
        
        guard moneyIndex < moneys.count else { return }
        let currentMoney = moneys[moneyIndex]
        moneyLabel.text = currentMoney.money
        
        gameView.update(with: currentQuestion.answers)
    }
    
    private func selectAnswer(idx: Int) {
        guard questionIndex < questions.count else { return }
        let currentQuestion = questions[questionIndex]
        
        let answer = currentQuestion.answers[idx]
        
        gameView.updateButton(idx: idx, isCorrect: answer.isCorrect)
        
        if answer.isCorrect {
            questionIndex += 1
            moneyIndex += 1
            unAlphaButton()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: DispatchWorkItem(block: {
                self.setupQuestion()
            }))
        } else {
            print("Dismiss to Question Screen!")
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    private func youLose() {
        timer?.invalidate()
        timer = nil
        
        print("Dismiss to Question Screen!")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupFiftyFiftyButtonTouch() {
        buttonFiftyFifty.addTarget(self, action: #selector(buttonFiftyFiftyAction), for: .touchUpInside)
    }
    
    @objc func buttonFiftyFiftyAction() {
        buttonFiftyFifty.bottomButtonImage.image = UIImage(named: "help50:50ImageCross")
  
        var buttonsArray = gameView.answerButtons
        buttonsArray.remove(at: 0)
        buttonsArray.remove(at: Int.random(in: 0..<buttonsArray.count))
        
        for button in buttonsArray {
            button.alpha = 0.5
        }
    }

    
    private func setupCallAFriendButtonTouch() {
        buttonCallAFriend.addTarget(self, action: #selector(buttonCallAFriendAction), for: .touchUpInside)
    }
    
    @objc func buttonCallAFriendAction() {
        buttonCallAFriend.bottomButtonImage.image = UIImage(named: "callFriendImageCross")
        var buttonsArray = gameView.answerButtons
        buttonsArray.remove(at: 0)
        buttonsArray.remove(at: Int.random(in: 0..<buttonsArray.count))
        
        for button in buttonsArray {
            button.alpha = 0.5
        }
    }
    
    private func setupHelpAudienceButtonTouch() {
        buttonHelpAudience.addTarget(self, action: #selector(buttonHelpAudienceAction), for: .touchUpInside)
    }
    
    @objc func buttonHelpAudienceAction() {
        buttonHelpAudience.bottomButtonImage.image = UIImage(named: "helpAudienceImageCross")
        var buttonsArray = gameView.answerButtons
        buttonsArray.remove(at: 0)
        
        for button in buttonsArray {
            button.alpha = 0.5
        }
    }
    
    private func unAlphaButton(){
        for button in gameView.answerButtons {
            button.alpha = 1
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
            make.right.equalToSuperview().offset(7)
            make.width.equalTo(281)
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
















////
////  ViewController.swift
////  How to be a Millionaire
////
////  Created by NikitaKorniuk   on 25.02.2024.
////
//
//import UIKit
//import SnapKit
//
//final class GameViewController: UIViewController {
//
//    //MARK: - Properties
//
//    private let logo: UIImageView = {
//        let view = UIImageView()
//
//        view.image = UIImage(named: "logoImage")
//        view.contentMode = .scaleAspectFit
//        return view
//    }()
//
//    private let topLabel: UILabel = {
//        let view = UILabel()
//        view.textColor = UIColor(red: 255/255,
//                                 green: 255/255,
//                                 blue: 255/255,
//                                 alpha: 1)
//        view.font = .systemFont(ofSize: 18, weight: .semibold)
//        view.numberOfLines = 0
//        return view
//    }()
//
//    private let gameView = GameView()
//
//    private let numberOfquestionLabel: UILabel = {
//        let view = UILabel()
//
//        view.textColor = UIColor(red: 255/255,
//                                 green: 255/255,
//                                 blue: 255/255,
//                                 alpha: 1)
//        view.font = .systemFont(ofSize: 24, weight: .semibold)
//        return view
//    }()
//
//    private let moneyLabel:  UILabel = {
//        let view = UILabel()
//
//        view.textColor = UIColor(red: 255/255,
//                                 green: 255/255,
//                                 blue: 255/255,
//                                 alpha: 1)
//        view.font = .systemFont(ofSize: 24, weight: .semibold)
//        return view
//    }()
//
//    private var questionIndex = 0
//    private let questions = Source().questionsArray
//
//    private var timer: Timer?
//
//    private let buttonFiftyFifty = CustomBottomButton(image: "help50:50Image")
//    private let buttonCallAFriend = CustomBottomButton(image: "callFriendImage")
//    private let buttonHelpAudience = CustomBottomButton(image: "helpAudienceImage")
//
//    //MARK: - Lifecycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupBackground()
//        setupViews()
//        setupConstraints()
//        setupQuestion()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { [weak self] timer in
//            self?.youLose()
//        }
//    }
//
//    //MARK: - Private methods
//
//    private func setupViews() {
//
//        gameView.onSelectAnswer = { [weak self] idx in
//            self?.selectAnswer(idx: idx)
//        }
//
//        view.addSubview(logo)
//        view.addSubview(topLabel)
//        view.addSubview(numberOfquestionLabel)
//        view.addSubview(moneyLabel)
//        view.addSubview(gameView)
//        view.addSubview(buttonFiftyFifty)
//        view.addSubview(buttonCallAFriend)
//        view.addSubview(buttonHelpAudience)
//    }
//
//    private func setupBackground() {
//        let background = UIImage(named: "background3")
//        var imageView: UIImageView!
//
//        imageView = UIImageView(frame: view.bounds)
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        imageView.image = background
//        imageView.center = view.center
//        view.addSubview(imageView)
//        self.view.sendSubviewToBack(imageView)
//    }
//
//    private func setupQuestion() {
//        guard questionIndex < questions.count else { return }
//        let currentQuestion = questions[questionIndex]
//        topLabel.text = currentQuestion.question
//        numberOfquestionLabel.text = "\(questionIndex + 1) Question"
//
//        gameView.update(with: currentQuestion.answers)
//    }
//
//    private func selectAnswer(idx: Int) {
//        guard questionIndex < questions.count else { return }
//        let currentQuestion = questions[questionIndex]
//
//        let answer = currentQuestion.answers[idx]
//
//        gameView.updateButton(idx: idx, isCorrect: answer.isCorrect)
//
//        if answer.isCorrect {
//            questionIndex += 1
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: DispatchWorkItem(block: {
//                self.setupQuestion()
//            }))
//        } else {
//            print("You lose Screen!")
//
//            //переход на следующий экран
//        }
//    }
//
//    private func youLose() {
//        timer?.invalidate()
//        timer = nil
//
//        print("You lose Screen!")
//        // переход на следующий экран
//    }
//}
//
////MARK: - GameView: - Extensions
//
//extension GameViewController {
//    private func setupConstraints() {
//        logo.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(19)
//            make.left.equalToSuperview().offset(18)
//            make.width.equalTo(87)
//            make.height.equalTo(87)
//        }
//        topLabel.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(9)
//            make.right.equalToSuperview().offset(7)
//            make.width.equalTo(281)
//            make.height.equalTo(126)
//
//        }
//        numberOfquestionLabel.snp.makeConstraints { make in
//            make.top.equalTo(logo.snp.bottom).offset(14)
//            make.left.equalToSuperview().offset(27)
//            make.width.equalTo(121)
//            make.height.equalTo(46)
//        }
//        moneyLabel.snp.makeConstraints { make in
//            make.top.equalTo(logo.snp.bottom).offset(14)
//            make.right.equalToSuperview()
//            make.width.equalTo(114)
//            make.height.equalTo(45)
//        }
//        gameView.snp.makeConstraints { make in
//            make.top.equalTo(moneyLabel.snp.bottom).offset(14)
//            make.bottom.equalTo(buttonFiftyFifty.snp.top).offset(-14)
//            make.right.equalToSuperview().inset(27)
//            make.left.equalToSuperview().inset(27)
//        }
//        buttonFiftyFifty.snp.makeConstraints { make in
//            make.left.equalTo(numberOfquestionLabel)
//            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(59)
//        }
//        buttonCallAFriend.snp.makeConstraints { make in
//            make.left.equalTo(buttonFiftyFifty.snp.right).offset(88)
//            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(59)
//        }
//        buttonHelpAudience.snp.makeConstraints { make in
//            make.right.equalTo(view.safeAreaLayoutGuide).inset(100)
//            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(59)
//        }
//
//    }
//}
