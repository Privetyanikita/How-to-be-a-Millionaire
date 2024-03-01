//
//  QuestionController.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.
//

import UIKit

class QuestionListViewController: UIViewController {
    
    // MARK: - Properties
    var tableView = UITableView()
    var questionList: [QuestionModel] = []
    
    struct Cells {
        static let questionCell = "QuestionListCell"
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        questionList = fetchData()
        configureTableView()
    }
    
    // MARK: - Methods
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        setTableViewBackground()
        setTableViewLogo()
        tableView.rowHeight = 50
        tableView.register(QuestionListCell.self, forCellReuseIdentifier: Cells.questionCell)
        tableView.separatorStyle = .none
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setTableViewBackground() {
        let backgroundImage = Constants.background.backgroundWithBlur
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        tableView.backgroundView = backgroundImageView
    }
    
    func setTableViewLogo() {
        let logoImageView = UIImageView(image: Constants.logoImage)
        logoImageView.contentMode = .scaleAspectFit
        tableView.tableHeaderView = logoImageView

        let topInset = 10 // высота вашего логотипа
        tableView.contentInset = UIEdgeInsets(top: CGFloat(topInset), left: 0, bottom: 0, right: 0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let startViewController = StartViewController()
        present(startViewController, animated: true, completion: nil)
    }
}

// MARK: - Extensions
extension QuestionListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.questionCell) as! QuestionListCell
        let question = questionList[indexPath.row]
        cell.set(question: question)
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
}

extension QuestionListViewController {
    
    func fetchData() -> [QuestionModel] {
        let question15 = QuestionModel(image: Constants.buttonForTable.yellowButton, question: "Вопрос 15", money: "1 Миллион")
        let question14 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Вопрос 14", money: "500000 RUB")
        let question13 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Вопрос 13", money: "250000 RUB")
        let question12 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Вопрос 12", money: "125000 RUB")
        let question11 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Вопрос 11", money: "64000 RUB")
        let question10 = QuestionModel(image: Constants.buttonForTable.blueButton, question: "Вопрос 10", money: "32000 RUB")
        let question9 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Вопрос 9", money: "16000 RUB")
        let question8 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Вопрос 8", money: "8000 RUB")
        let question7 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Вопрос 7", money: "4000 RUB")
        let question6 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Вопрос 6", money: "2000 RUB")
        let question5 = QuestionModel(image: Constants.buttonForTable.blueButton, question: "Вопрос 5", money: "1000 RUB")
        let question4 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Вопрос 4", money: "500 RUB")
        let question3 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Вопрос 3", money: "300 RUB")
        let question2 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Вопрос 2", money: "200 RUB")
        let question1 = QuestionModel(image: Constants.buttonForTable.greenButton, question: "Вопрос 1", money: "100 RUB")
        
        return [question15, question14, question13, question12, question11, question10, question9, question8, question7, question6, question5, question4, question3, question2, question1]
    }
}
