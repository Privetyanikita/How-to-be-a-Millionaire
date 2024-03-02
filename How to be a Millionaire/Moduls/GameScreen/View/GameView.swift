//
//  View.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.
//

import UIKit
import SnapKit

final class GameView: UIView {
    
    private var answerButtons: [CustomCenterButton] = []
    private var stackView: UIStackView = {
        var sv = UIStackView()
        sv.alignment = .center
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.spacing = 30
        return sv
    }()
    
    var onSelectAnswer: ((Int) -> Void)?
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with answers: [AnswerStruct]) {
        guard answers.count == answerButtons.count else {
            return
        }
        zip(answers, answerButtons).forEach { answer, button in
            button.updateValue(answer: answer.value)
        }
    }
    
    private func setupViews() {
        let answer1 = CustomCenterButton(char: "A")
        answer1.addTarget(self, action: #selector(answerButtonTouchUpInside), for: .touchUpInside)
        answer1.tag = 0
        
        let answer2 = CustomCenterButton(char: "B")
        answer2.addTarget(self, action: #selector(answerButtonTouchUpInside), for: .touchUpInside)
        answer2.tag = 1
        
        let answer3 = CustomCenterButton(char: "C")
        answer3.addTarget(self, action: #selector(answerButtonTouchUpInside), for: .touchUpInside)
        answer3.tag = 2
        
        let answer4 = CustomCenterButton(char: "D")
        answer4.addTarget(self, action: #selector(answerButtonTouchUpInside), for: .touchUpInside)
        answer4.tag = 3
        
        answerButtons = [
            answer1, answer2, answer3, answer4
        ]
        
        addSubview(stackView)
        answerButtons.forEach { button in
            stackView.addArrangedSubview(button)
        }
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    @objc func answerButtonTouchUpInside(_ sender: UIButton) {
        onSelectAnswer?(sender.tag)
    }
    
    public func updateButton(idx: Int, isCorrect: Bool) {
        let button = answerButtons[idx]
        button.updateButtonState(isCorrect: isCorrect)
    }
}














//import UIKit
//import SnapKit
//
//final class GameView: UIView {
//    
//    private var answerButtons: [CustomCenterButton] = []
//    private var stackView: UIStackView = {
//        var sv = UIStackView()
//        sv.alignment = .center
//        sv.axis = .vertical
//        sv.distribution = .equalSpacing
//        sv.spacing = 30
//        return sv
//    }()
//    
//    var onSelectAnswer: ((Int) -> Void)?
//    
//    init() {
//        super.init(frame: .zero)
//        
//        setupViews()
//        setupConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func update(with answers: [AnswerStruct]) {
//        guard answers.count == answerButtons.count else {
//            return
//        }
//        zip(answers, answerButtons).forEach { answer, button in
//            button.updateValue(answer: answer.value)
//        }
//    }
//    
//    private func setupViews() {
//        let answer1 = CustomCenterButton(char: "A")
//        answer1.addTarget(self, action: #selector(answerButtonTouchUpInside), for: .touchUpInside)
//        answer1.tag = 0
//        
//        let answer2 = CustomCenterButton(char: "B")
//        answer2.addTarget(self, action: #selector(answerButtonTouchUpInside), for: .touchUpInside)
//        answer2.tag = 1
//        
//        let answer3 = CustomCenterButton(char: "C")
//        answer3.addTarget(self, action: #selector(answerButtonTouchUpInside), for: .touchUpInside)
//        answer3.tag = 2
//        
//        let answer4 = CustomCenterButton(char: "D")
//        answer4.addTarget(self, action: #selector(answerButtonTouchUpInside), for: .touchUpInside)
//        answer4.tag = 3
//        
//        answerButtons = [
//            answer1, answer2, answer3, answer4
//        ]
//        
//        addSubview(stackView)
//        answerButtons.forEach { button in
//            stackView.addArrangedSubview(button)
//        }
//    }
//    
//    private func setupConstraints() {
//        stackView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.bottom.lessThanOrEqualToSuperview()
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//        }
//    }
//    
//    @objc func answerButtonTouchUpInside(_ sender: UIButton) {
//        onSelectAnswer?(sender.tag)
//    }
//    
//    public func updateButton(idx: Int, isCorrect: Bool) {
//        let button = answerButtons[idx]
//        button.updateButtonState(isCorrect: isCorrect)
//    }
//}
