//
//  QuestionListCell.swift
//  How to be a Millionaire
//
//  Created by Марк Райтман on 29.02.2024.
//

import UIKit

protocol QuestionListCellDelegate: AnyObject {
    func didLoseGame()
}

class QuestionListCell: UITableViewCell {
    
    // MARK: - Properties
    var questionListImageView = UIImageView()
    var questionListLabel = UILabel()
    var moneyLabel = UILabel()
    
    weak var delegate: QuestionListCellDelegate?

    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureImageView()
        configureTitleLabel()
        configureMoneyLabel()
        
        setImageConstraints()
        setQuestionLabelConstraints()
        setMoneyLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI setup
    func set(question: QuestionModel, isCorrectAnswer: Bool?) {
        questionListLabel.text = question.question
        moneyLabel.text = question.money
        
        if let isCorrect = isCorrectAnswer {
            if isCorrect {
                questionListImageView.image = Constants.buttonForTable.greenButton // Замените "correctImage" на имя изображения для правильного ответа
            } else {
                questionListImageView.image = Constants.buttonForTable.redButton // Замените "incorrectImage" на имя изображения для неправильного ответа
                
                delegate?.didLoseGame()
            }
        } else {
            questionListImageView.image = question.image
        }
    }
    
    func configureImageView() {
        questionListImageView.layer.cornerRadius = 15
        questionListImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        questionListLabel.numberOfLines = 0
        questionListLabel.adjustsFontSizeToFitWidth = true
        questionListLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        questionListLabel.textAlignment = .left
    }
    
    func configureMoneyLabel() {
        moneyLabel.numberOfLines = 0
        moneyLabel.adjustsFontSizeToFitWidth = true
        moneyLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        moneyLabel.textAlignment = .right
    }
    
    
    // MARK: - Constraints
    func setImageConstraints() {
        
        /// ADDING SUBVIEWS
        addSubview(questionListImageView)
        
        /// TAMIC
        questionListImageView.translatesAutoresizingMaskIntoConstraints = false
        
        /// SETUP CONSTRAINTS
        NSLayoutConstraint.activate([
            questionListImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            questionListImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            questionListImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            questionListImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            questionListImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            questionListImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
    func setQuestionLabelConstraints() {
        
        /// ADDING SUBVIEWS
        questionListImageView.addSubview(questionListLabel)
        
        /// TAMIC
        questionListLabel.translatesAutoresizingMaskIntoConstraints = false
        
        /// SETUP CONSTRAINTS
        NSLayoutConstraint.activate([
            questionListLabel.leadingAnchor.constraint(equalTo: questionListImageView.leadingAnchor, constant: 10),
            
            questionListLabel.centerYAnchor.constraint(equalTo: questionListImageView.centerYAnchor),
            
            questionListLabel.widthAnchor.constraint(equalToConstant: 100),
            questionListLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    func setMoneyLabelConstraints() {
        
        /// ADDING SUBVIEWS
        questionListImageView.addSubview(moneyLabel)
        
        /// TAMIC
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        /// SETUP CONSTRAINTS
        NSLayoutConstraint.activate([
            moneyLabel.trailingAnchor.constraint(equalTo: questionListImageView.trailingAnchor, constant: -10),
            
            moneyLabel.centerYAnchor.constraint(equalTo: questionListImageView.centerYAnchor),
            
            moneyLabel.widthAnchor.constraint(equalToConstant: 100),
            moneyLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
}
