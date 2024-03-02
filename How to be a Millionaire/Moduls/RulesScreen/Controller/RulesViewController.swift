//
//  ViewController.swift
//  How to be a Millionaire
//
//  Created by NikitaKorniuk   on 25.02.2024.

import SnapKit
import UIKit

class RulesViewController: UIViewController {
    
    private let background: UIImageView = {
        let element = UIImageView()
        element.image = #imageLiteral(resourceName: "background1")
        return element
    }()
    
    private let textField: UITextView = {
        let element = UITextView()
        element.backgroundColor = .clear
        element.font = .systemFont(ofSize: 20)
        element.isEditable = false
        element.isScrollEnabled = true
        element.isSelectable = false
        element.text = textForRules.rulesText
        return element
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
    }
    
    private func setupViews(){
        title = "Rules"
        view.addSubview(background)
        view.addSubview(textField)
    }
}

extension RulesViewController{
    private func setupConstrains(){
        background.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        textField.snp.makeConstraints {maker in
            maker.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
