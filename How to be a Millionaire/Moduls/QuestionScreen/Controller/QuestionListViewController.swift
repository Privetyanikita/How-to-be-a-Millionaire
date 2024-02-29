//
//  QuestionController.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.
//

import UIKit

class QuestionListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let questionsAndPrizes = [
        (questionNumber: 1, prizeAmount: "$100"),
        (questionNumber: 2, prizeAmount: "$200"),
        (questionNumber: 3, prizeAmount: "$300"),
        (questionNumber: 4, prizeAmount: "$400"),
        (questionNumber: 5, prizeAmount: "$500"),
        (questionNumber: 6, prizeAmount: "$1,000"),
        (questionNumber: 7, prizeAmount: "$2,000"),
        (questionNumber: 8, prizeAmount: "$4,000"),
        (questionNumber: 9, prizeAmount: "$8,000"),
        (questionNumber: 10, prizeAmount: "$16,000"),
        (questionNumber: 11, prizeAmount: "$32,000"),
        (questionNumber: 12, prizeAmount: "$64,000"),
        (questionNumber: 13, prizeAmount: "$125,000"),
        (questionNumber: 14, prizeAmount: "$500,000"),
        (questionNumber: 15, prizeAmount: "$1,000,000")
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        setupUI()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsAndPrizes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let questionAndPrize = questionsAndPrizes[indexPath.row]
        
        let label = UILabel(frame: CGRect(x: 10, y: 5, width: cell.contentView.frame.width - 20, height: 30))
        label.textAlignment = .left
        label.text = "Question \(questionAndPrize.questionNumber)"
        cell.contentView.addSubview(label)
        
        let prizeLabel = UILabel(frame: CGRect(x: cell.contentView.frame.width - 110, y: 5, width: 100, height: 30))
        prizeLabel.textAlignment = .right
        prizeLabel.text = questionAndPrize.prizeAmount
        cell.contentView.addSubview(prizeLabel)
        
        // Добавление отступов к содержимому ячейки
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let startViewController = StartViewController()
        present(startViewController, animated: true, completion: nil)
    }
    
    // MARK: - UI Setup
    func setupUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
