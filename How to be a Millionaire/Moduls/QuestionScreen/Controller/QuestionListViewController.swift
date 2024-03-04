//
//  QuestionController.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.
//

import UIKit

// ̶T̶O̶D̶O̶ ̶-̶ ̶с̶д̶е̶л̶а̶т̶ь̶ ̶п̶е̶р̶е̶х̶о̶д̶ ̶н̶а̶ ̶э̶к̶р̶а̶н̶ ̶и̶г̶р̶ы̶
// ̶T̶O̶D̶O̶ ̶-̶ ̶п̶е̶р̶е̶д̶е̶л̶а̶т̶ь̶ ̶в̶с̶ё̶ ̶н̶а̶ ̶а̶н̶г̶л̶.̶ ̶я̶з̶ы̶к̶
// ̶T̶O̶D̶O̶ ̶-̶ ̶п̶о̶п̶р̶а̶в̶и̶т̶ь̶ ̶с̶у̶м̶м̶ы̶ ̶к̶ ̶п̶р̶а̶в̶о̶м̶у̶ ̶к̶р̶а̶ю̶
// ̶T̶O̶D̶O̶ ̶-̶ ̶п̶е̶р̶е̶д̶е̶л̶а̶т̶ь̶ ̶п̶е̶р̶е̶х̶о̶д̶ ̶н̶е̶ ̶п̶о̶ ̶н̶а̶ж̶а̶т̶и̶ю̶ ̶н̶а̶ ̶я̶ч̶е̶й̶к̶у̶,̶ ̶а̶ ̶п̶о̶ ̶т̶а̶й̶м̶е̶р̶у̶
// ̶T̶O̶D̶O̶ ̶-̶ ̶п̶е̶р̶е̶д̶а̶т̶ь̶ ̶н̶а̶ ̶м̶о̶й̶ ̶э̶к̶р̶а̶н̶ ̶р̶е̶з̶у̶л̶ь̶т̶а̶т̶ ̶о̶т̶в̶е̶т̶а̶ ̶и̶з̶ ̶э̶к̶р̶а̶н̶а̶ ̶и̶г̶р̶ы̶ ̶t̶r̶u̶e̶/̶f̶a̶l̶s̶e̶
// ̶T̶O̶D̶O̶ ̶-̶ ̶в̶ ̶з̶а̶в̶и̶с̶и̶м̶о̶с̶т̶и̶ ̶о̶т̶ ̶р̶е̶з̶у̶л̶ь̶т̶а̶т̶а̶ ̶м̶е̶н̶я̶т̶ь̶ ̶к̶а̶р̶т̶и̶н̶к̶у̶ ̶в̶ ̶я̶ч̶е̶й̶к̶е̶
//̶ ̶T̶O̶D̶O̶ ̶-̶ ̶с̶д̶е̶л̶а̶т̶ь̶ ̶т̶а̶к̶ ̶ч̶т̶о̶б̶ы̶ ̶п̶р̶о̶г̶р̶е̶с̶с̶ ̶и̶з̶м̶е̶н̶е̶н̶и̶я̶ ̶ц̶в̶е̶т̶а̶ ̶к̶а̶р̶т̶и̶н̶к̶и̶ ̶ш̶ё̶л̶ ̶с̶н̶и̶з̶у̶ ̶в̶в̶е̶р̶х̶
//̶ ̶T̶O̶D̶O̶ ̶-̶ ̶с̶д̶е̶л̶а̶т̶ь̶ ̶п̶е̶р̶е̶х̶о̶д̶ ̶п̶о̶с̶л̶е̶ ̶н̶е̶п̶р̶а̶в̶и̶л̶ь̶н̶о̶г̶о̶ ̶о̶т̶в̶е̶т̶а̶ ̶н̶а̶ ̶э̶к̶р̶а̶н̶ ̶п̶р̶о̶и̶г̶р̶ы̶ш̶а̶
// TODO - сделать изменение на жёлтый на несгораемых суммах
// TODO - сделать алерт на несгораемых суммах с опцией забора приза или продолжением игры
// TODO - сделать мигание вопроса с переходом на экран игры
// TODO - сделать переход на экран проигрыша после красного мигания ячейки





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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scheduleGameViewControllerPresentation() //переход на другой экран по времени
    }
    
    // MARK: - Methods
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        setTableViewBackground()
        setTableViewLogo()
        tableView.rowHeight = 45
        tableView.register(QuestionListCell.self, forCellReuseIdentifier: Cells.questionCell)
        tableView.separatorStyle = .none
//        tableView.isUserInteractionEnabled = false //отключает нажатие ячеек
        tableView.pin(to: view)
        navigationController?.navigationBar.isHidden = true
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
        
        let scale: CGFloat = 0.5 // Устанавливаем размер логотипа
        logoImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gameViewController = GameViewController()
        gameViewController.modalPresentationStyle = .fullScreen //делает разворот на весь экран телефона
        present(gameViewController, animated: true, completion: nil)
    }
    
    ///переход на другой экран по истечении нескольких секунд
    func scheduleGameViewControllerPresentation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // переход через 2 секунды
            let gameViewController = GameViewController()
            gameViewController.modalPresentationStyle = .fullScreen
            self.present(gameViewController, animated: true, completion: nil)
        }
    }
}

// MARK: - Extensions
extension QuestionListViewController: UITableViewDelegate, UITableViewDataSource, QuestionListCellDelegate {
    
    func didLoseGame() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let lossViewController = LossViewController()
            lossViewController.modalPresentationStyle = .fullScreen
            self.present(lossViewController, animated: true, completion: nil)
        }
    }
    
    func didWinGame() {
        let alertController = UIAlertController(title: "Congratulations!", message: "You've won 1000000$!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            let lossViewController = LossViewController()
            lossViewController.modalPresentationStyle = .fullScreen
            self.present(lossViewController, animated: true, completion: nil)
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.questionCell) as! QuestionListCell
        let question = questionList[indexPath.row]
        cell.delegate = self
        
        // Проверяем, является ли это последний вопрос
        if indexPath.row == 0 {
            cell.isLastQuestion = true
        } else {
            cell.isLastQuestion = false
        }
        
        cell.set(question: question, isCorrectAnswer: curanceQuestionStructStatic.correctAnswers.indices.contains(questionList.count - 1 - indexPath.row) ? curanceQuestionStructStatic.correctAnswers[questionList.count - 1 - indexPath.row] : nil)
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        return cell
    }
}

extension QuestionListViewController {
    //mock data
    func fetchData() -> [QuestionModel] {
        let question15 = QuestionModel(image: Constants.buttonForTable.yellowButton, question: "Question 15", money: "1 Million")
        let question14 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 14", money: "500000 $")
        let question13 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 13", money: "250000 $")
        let question12 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 12", money: "125000 $")
        let question11 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 11", money: "64000 $")
        let question10 = QuestionModel(image: Constants.buttonForTable.yellowButton, question: "Question 10", money: "32000 $")
        let question9 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 9", money: "16000 $")
        let question8 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 8", money: "8000 $")
        let question7 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 7", money: "4000 $")
        let question6 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 6", money: "2000 $")
        let question5 = QuestionModel(image: Constants.buttonForTable.yellowButton, question: "Question 5", money: "1000 $")
        let question4 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 4", money: "500 $")
        let question3 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 3", money: "300 $")
        let question2 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 2", money: "200 $")
        let question1 = QuestionModel(image: Constants.buttonForTable.purpleButton, question: "Question 1", money: "100 $")
        
        return [question15, question14, question13, question12, question11, question10, question9, question8, question7, question6, question5, question4, question3, question2, question1]
    }
}
